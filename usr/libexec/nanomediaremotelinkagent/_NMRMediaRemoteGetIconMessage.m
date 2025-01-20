@interface _NMRMediaRemoteGetIconMessage
- (BOOL)hasBundleID;
- (BOOL)hasHeight;
- (BOOL)hasOriginIdentifier;
- (BOOL)hasTimestamp;
- (BOOL)hasWidth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleID;
- (double)height;
- (double)timestamp;
- (double)width;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)originIdentifier;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setHasHeight:(BOOL)a3;
- (void)setHasOriginIdentifier:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWidth:(BOOL)a3;
- (void)setHeight:(double)a3;
- (void)setOriginIdentifier:(int)a3;
- (void)setTimestamp:(double)a3;
- (void)setWidth:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRMediaRemoteGetIconMessage

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWidth:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_width = a3;
}

- (void)setHasWidth:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWidth
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHeight:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_height = a3;
}

- (void)setHasHeight:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHeight
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setOriginIdentifier:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_originIdentifier = a3;
}

- (void)setHasOriginIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasOriginIdentifier
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRMediaRemoteGetIconMessage;
  char v3 = [(_NMRMediaRemoteGetIconMessage *)&v7 description];
  v4 = [(_NMRMediaRemoteGetIconMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v9 = +[NSNumber numberWithDouble:self->_timestamp];
    [v3 setObject:v9 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v10 = +[NSNumber numberWithDouble:self->_width];
  [v3 setObject:v10 forKey:@"width"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5 = +[NSNumber numberWithDouble:self->_height];
    [v3 setObject:v5 forKey:@"height"];
  }
LABEL_5:
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    objc_super v7 = +[NSNumber numberWithInt:self->_originIdentifier];
    [v3 setObject:v7 forKey:@"originIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000D894((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  if (*(unsigned char *)&self->_has) {
LABEL_4:
  }
    PBDataWriterWriteDoubleField();
LABEL_5:
  if (self->_bundleID) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_timestamp;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[3] = *(void *)&self->_width;
  *((unsigned char *)v4 + 44) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v4[1] = *(void *)&self->_height;
    *((unsigned char *)v4 + 44) |= 1u;
  }
LABEL_5:
  if (self->_bundleID)
  {
    v6 = v4;
    [v4 setBundleID:];
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_originIdentifier;
    *((unsigned char *)v4 + 44) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 44) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v5[3] = *(void *)&self->_width;
  *((unsigned char *)v5 + 44) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    v5[1] = *(void *)&self->_height;
    *((unsigned char *)v5 + 44) |= 1u;
  }
LABEL_5:
  id v8 = [(NSString *)self->_bundleID copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v6 + 10) = self->_originIdentifier;
    *((unsigned char *)v6 + 44) |= 8u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_timestamp != *((double *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_width != *((double *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_height != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_24;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
    {
LABEL_24:
      BOOL v7 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 44) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_originIdentifier != *((_DWORD *)v4 + 10)) {
      goto LABEL_24;
    }
    BOOL v7 = 1;
  }
LABEL_25:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double timestamp = self->_timestamp;
    double v6 = -timestamp;
    if (timestamp >= 0.0) {
      double v6 = self->_timestamp;
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
  if ((has & 4) != 0)
  {
    double width = self->_width;
    double v11 = -width;
    if (width >= 0.0) {
      double v11 = self->_width;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if (has)
  {
    double height = self->_height;
    double v16 = -height;
    if (height >= 0.0) {
      double v16 = self->_height;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_bundleID hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v20 = 2654435761 * self->_originIdentifier;
  }
  else {
    uint64_t v20 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v20 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_double timestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_double width = *((double *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 44))
  {
LABEL_4:
    self->_double height = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[_NMRMediaRemoteGetIconMessage setBundleID:](self, "setBundleID:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    self->_originIdentifier = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (double)timestamp
{
  return self->_timestamp;
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (int)originIdentifier
{
  return self->_originIdentifier;
}

- (void).cxx_destruct
{
}

@end