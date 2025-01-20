@interface MSPMediaSyncHeader
- (BOOL)hasSyncType;
- (BOOL)hasTotalPackages;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)syncTypeAsString:(int)a3;
- (int)StringAsSyncType:(id)a3;
- (int)syncType;
- (int)totalPackages;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSyncType:(BOOL)a3;
- (void)setHasTotalPackages:(BOOL)a3;
- (void)setSyncType:(int)a3;
- (void)setTotalPackages:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPMediaSyncHeader

- (int)totalPackages
{
  return self->_totalPackages;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_totalPackages = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_syncType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_totalPackages;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_syncType;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_totalPackages != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_syncType != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_totalPackages;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_syncType;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_totalPackages;
    *((unsigned char *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_syncType;
    *((unsigned char *)v4 + 16) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return MSPMediaSyncHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    BOOL v5 = [NSNumber numberWithInt:self->_totalPackages];
    [v3 setObject:v5 forKey:@"totalPackages"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int syncType = self->_syncType;
    if (syncType == 1)
    {
      v7 = @"Reset";
    }
    else if (syncType == 2)
    {
      v7 = @"Delta";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_syncType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v7 forKey:@"syncType"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPMediaSyncHeader;
  id v4 = [(MSPMediaSyncHeader *)&v8 description];
  BOOL v5 = [(MSPMediaSyncHeader *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsSyncType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"Reset"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"Delta"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)syncTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"Reset";
  }
  else if (a3 == 2)
  {
    int v4 = @"Delta";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)hasSyncType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSyncType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSyncType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int syncType = a3;
}

- (int)syncType
{
  if (*(unsigned char *)&self->_has) {
    return self->_syncType;
  }
  else {
    return 1;
  }
}

- (BOOL)hasTotalPackages
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTotalPackages:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTotalPackages:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_totalPackages = a3;
}

@end