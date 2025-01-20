@interface AWDSpringBoardBreadcrumb
- (BOOL)hasEntityID;
- (BOOL)hasTimestamp;
- (BOOL)hasType;
- (BOOL)hasWasTapped;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasTapped;
- (NSString)entityID;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEntityID:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWasTapped:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setType:(id)a3;
- (void)setWasTapped:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSpringBoardBreadcrumb

- (void)dealloc
{
  [(AWDSpringBoardBreadcrumb *)self setType:0];
  [(AWDSpringBoardBreadcrumb *)self setEntityID:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardBreadcrumb;
  [(AWDSpringBoardBreadcrumb *)&v3 dealloc];
}

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

- (void)setWasTapped:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_wasTapped = a3;
}

- (void)setHasWasTapped:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWasTapped
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasEntityID
{
  return self->_entityID != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardBreadcrumb;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDSpringBoardBreadcrumb description](&v3, sel_description), -[AWDSpringBoardBreadcrumb dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithBool:self->_wasTapped] forKey:@"wasTapped"];
  }
  type = self->_type;
  if (type) {
    [v3 setObject:type forKey:@"type"];
  }
  entityID = self->_entityID;
  if (entityID) {
    [v3 setObject:entityID forKey:@"entityID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardBreadcrumbReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_type) {
    PBDataWriterWriteStringField();
  }
  if (self->_entityID)
  {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)a3 + 32) = self->_wasTapped;
    *((unsigned char *)a3 + 36) |= 2u;
  }
  if (self->_type) {
    [a3 setType:];
  }
  if (self->_entityID)
  {
    [a3 setEntityID:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_wasTapped;
    *(unsigned char *)(v5 + 36) |= 2u;
  }

  *(void *)(v6 + 24) = [(NSString *)self->_type copyWithZone:a3];
  *(void *)(v6 + 16) = [(NSString *)self->_entityID copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)a3 + 36))
  {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)a3 + 36) & 2) == 0) {
      goto LABEL_17;
    }
LABEL_11:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 36) & 2) == 0) {
    goto LABEL_11;
  }
  if (self->_wasTapped)
  {
    if (!*((unsigned char *)a3 + 32)) {
      goto LABEL_11;
    }
    goto LABEL_17;
  }
  if (*((unsigned char *)a3 + 32)) {
    goto LABEL_11;
  }
LABEL_17:
  type = self->_type;
  if (!((unint64_t)type | *((void *)a3 + 3)) || (int v5 = -[NSString isEqual:](type, "isEqual:")) != 0)
  {
    entityID = self->_entityID;
    if ((unint64_t)entityID | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSString isEqual:](entityID, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_wasTapped;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_type hash];
  return v5 ^ [(NSString *)self->_entityID hash];
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 36);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_wasTapped = *((unsigned char *)a3 + 32);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)a3 + 3)) {
    -[AWDSpringBoardBreadcrumb setType:](self, "setType:");
  }
  if (*((void *)a3 + 2))
  {
    -[AWDSpringBoardBreadcrumb setEntityID:](self, "setEntityID:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)wasTapped
{
  return self->_wasTapped;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)entityID
{
  return self->_entityID;
}

- (void)setEntityID:(id)a3
{
}

@end