@interface NEKPBSetParticipantStatus
- (BOOL)hasItemIdentifier;
- (BOOL)hasSpan;
- (BOOL)hasStatus;
- (BOOL)hasStoreIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)itemIdentifier;
- (NSString)storeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)span;
- (unsigned)status;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSpan:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setSpan:(unsigned int)a3;
- (void)setStatus:(unsigned int)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBSetParticipantStatus

- (void)setStatus:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSpan:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_span = a3;
}

- (void)setHasSpan:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSpan
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasItemIdentifier
{
  return self->_itemIdentifier != 0;
}

- (BOOL)hasStoreIdentifier
{
  return self->_storeIdentifier != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBSetParticipantStatus;
  char v3 = [(NEKPBSetParticipantStatus *)&v7 description];
  v4 = [(NEKPBSetParticipantStatus *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedInt:self->_status];
    [v3 setObject:v5 forKey:@"status"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_span];
    [v3 setObject:v6 forKey:@"span"];
  }
  itemIdentifier = self->_itemIdentifier;
  if (itemIdentifier) {
    [v3 setObject:itemIdentifier forKey:@"itemIdentifier"];
  }
  storeIdentifier = self->_storeIdentifier;
  if (storeIdentifier) {
    [v3 setObject:storeIdentifier forKey:@"storeIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10006B374((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_itemIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_storeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_status;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[4] = self->_span;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  id v6 = v4;
  if (self->_itemIdentifier)
  {
    [v4 setItemIdentifier:];
    id v4 = v6;
  }
  if (self->_storeIdentifier)
  {
    [v6 setStoreIdentifier:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = self->_status;
    *((unsigned char *)v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 4) = self->_span;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v8 = [(NSString *)self->_itemIdentifier copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  id v10 = [(NSString *)self->_storeIdentifier copyWithZone:a3];
  v11 = (void *)v6[3];
  v6[3] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_status != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    unsigned __int8 v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_span != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_16;
  }
  itemIdentifier = self->_itemIdentifier;
  if ((unint64_t)itemIdentifier | *((void *)v4 + 1)
    && !-[NSString isEqual:](itemIdentifier, "isEqual:"))
  {
    goto LABEL_16;
  }
  storeIdentifier = self->_storeIdentifier;
  if ((unint64_t)storeIdentifier | *((void *)v4 + 3)) {
    unsigned __int8 v7 = -[NSString isEqual:](storeIdentifier, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_status;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_span;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(NSString *)self->_itemIdentifier hash];
  return v5 ^ [(NSString *)self->_storeIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if (v5)
  {
    self->_span = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[NEKPBSetParticipantStatus setItemIdentifier:](self, "setItemIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[NEKPBSetParticipantStatus setStoreIdentifier:](self, "setStoreIdentifier:");
    id v4 = v6;
  }
}

- (unsigned)status
{
  return self->_status;
}

- (unsigned)span
{
  return self->_span;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeIdentifier, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end