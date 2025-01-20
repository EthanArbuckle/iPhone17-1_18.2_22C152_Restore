@interface PPM2DatabaseCheckViolationCount
- (BOOL)hasActiveTreatments;
- (BOOL)hasPragmaCheckType;
- (BOOL)hasSchemaVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activeTreatments;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pragmaCheckTypeAsString:(int)a3;
- (int)StringAsPragmaCheckType:(id)a3;
- (int)pragmaCheckType;
- (unint64_t)hash;
- (unsigned)schemaVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setHasPragmaCheckType:(BOOL)a3;
- (void)setHasSchemaVersion:(BOOL)a3;
- (void)setPragmaCheckType:(int)a3;
- (void)setSchemaVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2DatabaseCheckViolationCount

- (void).cxx_destruct
{
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (unsigned)schemaVersion
{
  return self->_schemaVersion;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_schemaVersion = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if (v5)
  {
    self->_pragmaCheckType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[PPM2DatabaseCheckViolationCount setActiveTreatments:](self, "setActiveTreatments:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_schemaVersion;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_activeTreatments hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_pragmaCheckType;
  return v3 ^ v2 ^ [(NSString *)self->_activeTreatments hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_schemaVersion != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_pragmaCheckType != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](activeTreatments, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_schemaVersion;
    *(unsigned char *)(v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_pragmaCheckType;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_schemaVersion;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[4] = self->_pragmaCheckType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_activeTreatments)
  {
    char v6 = v4;
    objc_msgSend(v4, "setActiveTreatments:");
    id v4 = v6;
  }
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
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2DatabaseCheckViolationCountReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedInt:self->_schemaVersion];
    [v3 setObject:v5 forKey:@"schemaVersion"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t pragmaCheckType = self->_pragmaCheckType;
    if (pragmaCheckType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_pragmaCheckType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E65D6F90[pragmaCheckType];
    }
    [v3 setObject:v7 forKey:@"pragmaCheckType"];
  }
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v3 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2DatabaseCheckViolationCount;
  id v4 = [(PPM2DatabaseCheckViolationCount *)&v8 description];
  uint64_t v5 = [(PPM2DatabaseCheckViolationCount *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

- (int)StringAsPragmaCheckType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UnknownCheck"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IntegrityCheck"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ForeignKeyCheck"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)pragmaCheckTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65D6F90[a3];
  }
  return v3;
}

- (BOOL)hasPragmaCheckType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPragmaCheckType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setPragmaCheckType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t pragmaCheckType = a3;
}

- (int)pragmaCheckType
{
  if (*(unsigned char *)&self->_has) {
    return self->_pragmaCheckType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasSchemaVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSchemaVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSchemaVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_schemaVersion = a3;
}

@end