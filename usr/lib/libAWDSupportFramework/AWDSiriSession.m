@interface AWDSiriSession
+ (Class)siriRequestType;
- (BOOL)hasCompanionModel;
- (BOOL)hasCompanionOS;
- (BOOL)hasSessionEndTimestamp;
- (BOOL)hasSessionStartTimestamp;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)siriRequests;
- (NSString)companionModel;
- (NSString)companionOS;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)siriRequestAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)sessionEndTimestamp;
- (unint64_t)sessionStartTimestamp;
- (unint64_t)siriRequestsCount;
- (unint64_t)timestamp;
- (void)addSiriRequest:(id)a3;
- (void)clearSiriRequests;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCompanionModel:(id)a3;
- (void)setCompanionOS:(id)a3;
- (void)setHasSessionEndTimestamp:(BOOL)a3;
- (void)setHasSessionStartTimestamp:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSessionEndTimestamp:(unint64_t)a3;
- (void)setSessionStartTimestamp:(unint64_t)a3;
- (void)setSiriRequests:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSiriSession

- (void)dealloc
{
  [(AWDSiriSession *)self setCompanionModel:0];
  [(AWDSiriSession *)self setCompanionOS:0];
  [(AWDSiriSession *)self setSiriRequests:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSiriSession;
  [(AWDSiriSession *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSessionStartTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sessionStartTimestamp = a3;
}

- (void)setHasSessionStartTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionStartTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSessionEndTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sessionEndTimestamp = a3;
}

- (void)setHasSessionEndTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionEndTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasCompanionModel
{
  return self->_companionModel != 0;
}

- (BOOL)hasCompanionOS
{
  return self->_companionOS != 0;
}

- (void)clearSiriRequests
{
}

- (void)addSiriRequest:(id)a3
{
  siriRequests = self->_siriRequests;
  if (!siriRequests)
  {
    siriRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_siriRequests = siriRequests;
  }

  [(NSMutableArray *)siriRequests addObject:a3];
}

- (unint64_t)siriRequestsCount
{
  return [(NSMutableArray *)self->_siriRequests count];
}

- (id)siriRequestAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_siriRequests objectAtIndex:a3];
}

+ (Class)siriRequestType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSiriSession;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSiriSession description](&v3, sel_description), -[AWDSiriSession dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sessionStartTimestamp] forKey:@"sessionStartTimestamp"];
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sessionEndTimestamp] forKey:@"sessionEndTimestamp"];
LABEL_5:
  companionModel = self->_companionModel;
  if (companionModel) {
    [v3 setObject:companionModel forKey:@"companionModel"];
  }
  companionOS = self->_companionOS;
  if (companionOS) {
    [v3 setObject:companionOS forKey:@"companionOS"];
  }
  if ([(NSMutableArray *)self->_siriRequests count])
  {
    v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_siriRequests, "count")];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    siriRequests = self->_siriRequests;
    uint64_t v9 = [(NSMutableArray *)siriRequests countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(siriRequests);
          }
          [v7 addObject:[*(id *)(*((void *)&v14 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v10 = [(NSMutableArray *)siriRequests countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
    [v3 setObject:v7 forKey:@"siriRequest"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSiriSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_companionModel) {
    PBDataWriterWriteStringField();
  }
  if (self->_companionOS) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  siriRequests = self->_siriRequests;
  uint64_t v6 = [(NSMutableArray *)siriRequests countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(siriRequests);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)siriRequests countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((unsigned char *)a3 + 56) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_sessionStartTimestamp;
  *((unsigned char *)a3 + 56) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((void *)a3 + 1) = self->_sessionEndTimestamp;
    *((unsigned char *)a3 + 56) |= 1u;
  }
LABEL_5:
  if (self->_companionModel) {
    [a3 setCompanionModel:];
  }
  if (self->_companionOS) {
    [a3 setCompanionOS:];
  }
  if ([(AWDSiriSession *)self siriRequestsCount])
  {
    [a3 clearSiriRequests];
    unint64_t v6 = [(AWDSiriSession *)self siriRequestsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addSiriRequest:-[AWDSiriSession siriRequestAtIndex:](self, "siriRequestAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(unsigned char *)(v5 + 56) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_sessionStartTimestamp;
  *(unsigned char *)(v5 + 56) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(void *)(v5 + 8) = self->_sessionEndTimestamp;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
LABEL_5:

  *(void *)(v6 + 32) = [(NSString *)self->_companionModel copyWithZone:a3];
  *(void *)(v6 + 40) = [(NSString *)self->_companionOS copyWithZone:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  siriRequests = self->_siriRequests;
  uint64_t v9 = [(NSMutableArray *)siriRequests countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(siriRequests);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addSiriRequest:v13];
      }
      uint64_t v10 = [(NSMutableArray *)siriRequests countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_23;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 4) != 0)
    {
LABEL_23:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_sessionStartTimestamp != *((void *)a3 + 2)) {
        goto LABEL_23;
      }
    }
    else if ((*((unsigned char *)a3 + 56) & 2) != 0)
    {
      goto LABEL_23;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_sessionEndTimestamp != *((void *)a3 + 1)) {
        goto LABEL_23;
      }
    }
    else if (*((unsigned char *)a3 + 56))
    {
      goto LABEL_23;
    }
    companionModel = self->_companionModel;
    if (!((unint64_t)companionModel | *((void *)a3 + 4))
      || (int v5 = -[NSString isEqual:](companionModel, "isEqual:")) != 0)
    {
      companionOS = self->_companionOS;
      if (!((unint64_t)companionOS | *((void *)a3 + 5))
        || (int v5 = -[NSString isEqual:](companionOS, "isEqual:")) != 0)
      {
        siriRequests = self->_siriRequests;
        if ((unint64_t)siriRequests | *((void *)a3 + 6))
        {
          LOBYTE(v5) = -[NSMutableArray isEqual:](siriRequests, "isEqual:");
        }
        else
        {
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v5 = 0;
    goto LABEL_8;
  }
  unint64_t v3 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_sessionStartTimestamp;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v5 = 2654435761u * self->_sessionEndTimestamp;
LABEL_8:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_companionModel hash];
  NSUInteger v7 = [(NSString *)self->_companionOS hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_siriRequests hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 56);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 56) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionStartTimestamp = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 56))
  {
LABEL_4:
    self->_sessionEndTimestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)a3 + 4)) {
    -[AWDSiriSession setCompanionModel:](self, "setCompanionModel:");
  }
  if (*((void *)a3 + 5)) {
    -[AWDSiriSession setCompanionOS:](self, "setCompanionOS:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  NSUInteger v6 = (void *)*((void *)a3 + 6);
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
        [(AWDSiriSession *)self addSiriRequest:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)sessionStartTimestamp
{
  return self->_sessionStartTimestamp;
}

- (unint64_t)sessionEndTimestamp
{
  return self->_sessionEndTimestamp;
}

- (NSString)companionModel
{
  return self->_companionModel;
}

- (void)setCompanionModel:(id)a3
{
}

- (NSString)companionOS
{
  return self->_companionOS;
}

- (void)setCompanionOS:(id)a3
{
}

- (NSMutableArray)siriRequests
{
  return self->_siriRequests;
}

- (void)setSiriRequests:(id)a3
{
}

@end