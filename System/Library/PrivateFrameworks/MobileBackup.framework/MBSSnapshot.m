@interface MBSSnapshot
+ (id)snapshot;
- (BOOL)hasAttributes;
- (BOOL)hasCommitted;
- (BOOL)hasLastModified;
- (BOOL)hasQuotaReserved;
- (BOOL)hasSnapshotID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIncompatible;
- (BOOL)readFrom:(id)a3;
- (MBSSnapshotAttributes)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)committed;
- (unint64_t)hash;
- (unint64_t)lastModified;
- (unint64_t)quotaReserved;
- (unsigned)snapshotID;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setCommitted:(unint64_t)a3;
- (void)setHasCommitted:(BOOL)a3;
- (void)setHasLastModified:(BOOL)a3;
- (void)setHasQuotaReserved:(BOOL)a3;
- (void)setHasSnapshotID:(BOOL)a3;
- (void)setLastModified:(unint64_t)a3;
- (void)setQuotaReserved:(unint64_t)a3;
- (void)setSnapshotID:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSSnapshot

- (void)dealloc
{
  [(MBSSnapshot *)self setAttributes:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSSnapshot;
  [(MBSSnapshot *)&v3 dealloc];
}

- (void)setSnapshotID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_snapshotID = a3;
}

- (void)setHasSnapshotID:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSnapshotID
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setQuotaReserved:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_quotaReserved = a3;
}

- (void)setHasQuotaReserved:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasQuotaReserved
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLastModified:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lastModified = a3;
}

- (void)setHasLastModified:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLastModified
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasAttributes
{
  return self->_attributes != 0;
}

- (void)setCommitted:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_committed = a3;
}

- (void)setHasCommitted:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCommitted
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSSnapshot;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSSnapshot *)&v3 description], [(MBSSnapshot *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_snapshotID), @"snapshotID");
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_quotaReserved), @"quotaReserved");
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_lastModified), @"lastModified");
LABEL_5:
  attributes = self->_attributes;
  if (attributes) {
    objc_msgSend(v3, "setObject:forKey:", -[MBSSnapshotAttributes dictionaryRepresentation](attributes, "dictionaryRepresentation"), @"attributes");
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_committed), @"committed");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MBSSnapshotReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_attributes) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_snapshotID;
    *((unsigned char *)a3 + 44) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 3) = self->_quotaReserved;
  *((unsigned char *)a3 + 44) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((void *)a3 + 2) = self->_lastModified;
    *((unsigned char *)a3 + 44) |= 2u;
  }
LABEL_5:
  if (self->_attributes) {
    objc_msgSend(a3, "setAttributes:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_committed;
    *((unsigned char *)a3 + 44) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_snapshotID;
    *((unsigned char *)v5 + 44) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = self->_quotaReserved;
  *((unsigned char *)v5 + 44) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v5[2] = self->_lastModified;
    *((unsigned char *)v5 + 44) |= 2u;
  }
LABEL_5:

  v6[4] = [(MBSSnapshotAttributes *)self->_attributes copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    v6[1] = self->_committed;
    *((unsigned char *)v6 + 44) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    char v7 = *((unsigned char *)a3 + 44);
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 8) == 0 || self->_snapshotID != *((_DWORD *)a3 + 10)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 8) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_quotaReserved != *((void *)a3 + 3)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 4) != 0)
    {
      goto LABEL_24;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_lastModified != *((void *)a3 + 2)) {
        goto LABEL_24;
      }
    }
    else if ((*((unsigned char *)a3 + 44) & 2) != 0)
    {
      goto LABEL_24;
    }
    attributes = self->_attributes;
    if ((unint64_t)attributes | *((void *)a3 + 4))
    {
      unsigned int v5 = -[MBSSnapshotAttributes isEqual:](attributes, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
      char v7 = *((unsigned char *)a3 + 44);
    }
    LOBYTE(v5) = (v7 & 1) == 0;
    if (has)
    {
      if ((v7 & 1) == 0 || self->_committed != *((void *)a3 + 1)) {
        goto LABEL_24;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_snapshotID;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_quotaReserved;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    unint64_t v5 = 2654435761u * self->_lastModified;
    goto LABEL_8;
  }
LABEL_7:
  unint64_t v5 = 0;
LABEL_8:
  unint64_t v6 = [(MBSSnapshotAttributes *)self->_attributes hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v7 = 2654435761u * self->_committed;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v7 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 44);
  if ((v5 & 8) != 0)
  {
    self->_snapshotID = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)a3 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_quotaReserved = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 44) & 2) != 0)
  {
LABEL_4:
    self->_lastModified = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  attributes = self->_attributes;
  uint64_t v7 = *((void *)a3 + 4);
  if (attributes)
  {
    if (v7) {
      -[MBSSnapshotAttributes mergeFrom:](attributes, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[MBSSnapshot setAttributes:](self, "setAttributes:");
  }
  if (*((unsigned char *)a3 + 44))
  {
    self->_committed = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)snapshotID
{
  return self->_snapshotID;
}

- (unint64_t)quotaReserved
{
  return self->_quotaReserved;
}

- (unint64_t)lastModified
{
  return self->_lastModified;
}

- (MBSSnapshotAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (unint64_t)committed
{
  return self->_committed;
}

+ (id)snapshot
{
  v2 = objc_alloc_init(MBSSnapshot);
  return v2;
}

- (BOOL)isIncompatible
{
  v2 = [(MBSSnapshot *)self attributes];
  id v3 = [v2 buildVersion];
  if (![v3 hasPrefix:@"9A"]
    || ([v3 substringFromIndex:2],
        unint64_t v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 intValue],
        v4,
        BOOL v6 = 1,
        v5 >= 259)
    && (v5 & 0xFFFFFFFE) != 0x10E)
  {
    if ([v3 hasPrefix:@"9A5"])
    {
      uint64_t v7 = [v3 substringFromIndex:3];
      unsigned int v8 = [v7 intValue];

      BOOL v6 = v8 == 248 || v8 == 220;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

@end