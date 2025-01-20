@interface KCellularDownlinkIpPacketFilterStatus
+ (Class)filtersType;
- (BOOL)hasBearerContextId;
- (BOOL)hasIsActivated;
- (BOOL)hasIsEchoReqBlocked;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isActivated;
- (BOOL)isEchoReqBlocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)filters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)filtersAtIndex:(unint64_t)a3;
- (unint64_t)filtersCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)bearerContextId;
- (unsigned)subsId;
- (void)addFilters:(id)a3;
- (void)clearFilters;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBearerContextId:(unsigned int)a3;
- (void)setFilters:(id)a3;
- (void)setHasBearerContextId:(BOOL)a3;
- (void)setHasIsActivated:(BOOL)a3;
- (void)setHasIsEchoReqBlocked:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsActivated:(BOOL)a3;
- (void)setIsEchoReqBlocked:(BOOL)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularDownlinkIpPacketFilterStatus

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBearerContextId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bearerContextId = a3;
}

- (void)setHasBearerContextId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBearerContextId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsActivated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isActivated = a3;
}

- (void)setHasIsActivated:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsActivated
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsEchoReqBlocked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isEchoReqBlocked = a3;
}

- (void)setHasIsEchoReqBlocked:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsEchoReqBlocked
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearFilters
{
}

- (void)addFilters:(id)a3
{
  id v4 = a3;
  filters = self->_filters;
  id v8 = v4;
  if (!filters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_filters;
    self->_filters = v6;

    id v4 = v8;
    filters = self->_filters;
  }
  [(NSMutableArray *)filters addObject:v4];
}

- (unint64_t)filtersCount
{
  return [(NSMutableArray *)self->_filters count];
}

- (id)filtersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_filters objectAtIndex:a3];
}

+ (Class)filtersType
{
  return (Class)objc_opt_class();
}

- (void)setSubsId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSubsId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularDownlinkIpPacketFilterStatus;
  id v4 = [(KCellularDownlinkIpPacketFilterStatus *)&v8 description];
  v5 = [(KCellularDownlinkIpPacketFilterStatus *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v15 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v15 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v16 = [NSNumber numberWithUnsignedInt:self->_bearerContextId];
  [v3 setObject:v16 forKey:@"bearer_context_id"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_22:
  v17 = [NSNumber numberWithBool:self->_isActivated];
  [v3 setObject:v17 forKey:@"is_activated"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    v5 = [NSNumber numberWithBool:self->_isEchoReqBlocked];
    [v3 setObject:v5 forKey:@"is_echo_req_blocked"];
  }
LABEL_6:
  if ([(NSMutableArray *)self->_filters count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_filters, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v7 = self->_filters;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"filters"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v13 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v13 forKey:@"subs_id"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularDownlinkIpPacketFilterStatusReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_filters;
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

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_17:
      *((unsigned char *)v4 + 36) = self->_isActivated;
      *((unsigned char *)v4 + 40) |= 8u;
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 4) = self->_bearerContextId;
  *((unsigned char *)v4 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_17;
  }
LABEL_4:
  if ((has & 0x10) != 0)
  {
LABEL_5:
    *((unsigned char *)v4 + 37) = self->_isEchoReqBlocked;
    *((unsigned char *)v4 + 40) |= 0x10u;
  }
LABEL_6:
  id v10 = v4;
  if ([(KCellularDownlinkIpPacketFilterStatus *)self filtersCount])
  {
    [v10 clearFilters];
    unint64_t v6 = [(KCellularDownlinkIpPacketFilterStatus *)self filtersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(KCellularDownlinkIpPacketFilterStatus *)self filtersAtIndex:i];
        [v10 addFilters:v9];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v10 + 8) = self->_subsId;
    *((unsigned char *)v10 + 40) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_bearerContextId;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  *(unsigned char *)(v5 + 36) = self->_isActivated;
  *(unsigned char *)(v5 + 40) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 37) = self->_isEchoReqBlocked;
    *(unsigned char *)(v5 + 40) |= 0x10u;
  }
LABEL_6:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_filters;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v6 addFilters:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_subsId;
    *(unsigned char *)(v6 + 40) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_35;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 40);
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_35;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_bearerContextId != *((_DWORD *)v4 + 4)) {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0) {
      goto LABEL_35;
    }
    if (self->_isActivated)
    {
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_35;
      }
    }
    else if (*((unsigned char *)v4 + 36))
    {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
    goto LABEL_35;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 0x10) == 0) {
      goto LABEL_35;
    }
    if (self->_isEchoReqBlocked)
    {
      if (!*((unsigned char *)v4 + 37)) {
        goto LABEL_35;
      }
    }
    else if (*((unsigned char *)v4 + 37))
    {
      goto LABEL_35;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
    goto LABEL_35;
  }
  filters = self->_filters;
  if (!((unint64_t)filters | *((void *)v4 + 3))) {
    goto LABEL_31;
  }
  if (!-[NSMutableArray isEqual:](filters, "isEqual:"))
  {
LABEL_35:
    BOOL v8 = 0;
    goto LABEL_36;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 40);
LABEL_31:
  BOOL v8 = (v6 & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_subsId != *((_DWORD *)v4 + 8)) {
      goto LABEL_35;
    }
    BOOL v8 = 1;
  }
LABEL_36:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_bearerContextId;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_isActivated;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_isEchoReqBlocked;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  uint64_t v7 = [(NSMutableArray *)self->_filters hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_subsId;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 40);
  if (v6)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 40);
    if ((v6 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_bearerContextId = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  char v6 = *((unsigned char *)v4 + 40);
  if ((v6 & 8) == 0)
  {
LABEL_4:
    if ((v6 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_18:
  self->_isActivated = *((unsigned char *)v4 + 36);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
LABEL_5:
    self->_isEchoReqBlocked = *((unsigned char *)v4 + 37);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_6:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 3);
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
        -[KCellularDownlinkIpPacketFilterStatus addFilters:](self, "addFilters:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if ((v5[10] & 4) != 0)
  {
    self->_subsId = v5[8];
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)bearerContextId
{
  return self->_bearerContextId;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (BOOL)isEchoReqBlocked
{
  return self->_isEchoReqBlocked;
}

- (NSMutableArray)filters
{
  return self->_filters;
}

- (void)setFilters:(id)a3
{
}

- (unsigned)subsId
{
  return self->_subsId;
}

- (void).cxx_destruct
{
}

@end