@interface NTPBOptInButtonExposure
- (BOOL)hasGroupViewExposureId;
- (BOOL)hasOptInButtonLocation;
- (BOOL)hasOptInButtonLocationId;
- (BOOL)hasOptInButtonType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)groupViewExposureId;
- (NSString)optInButtonLocationId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)optInButtonLocation;
- (int)optInButtonType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setGroupViewExposureId:(id)a3;
- (void)setHasOptInButtonLocation:(BOOL)a3;
- (void)setHasOptInButtonType:(BOOL)a3;
- (void)setOptInButtonLocation:(int)a3;
- (void)setOptInButtonLocationId:(id)a3;
- (void)setOptInButtonType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBOptInButtonExposure

- (int)optInButtonType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_optInButtonType;
  }
  else {
    return 0;
  }
}

- (void)setOptInButtonType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_optInButtonType = a3;
}

- (void)setHasOptInButtonType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOptInButtonType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)optInButtonLocation
{
  if (*(unsigned char *)&self->_has) {
    return self->_optInButtonLocation;
  }
  else {
    return 0;
  }
}

- (void)setOptInButtonLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_optInButtonLocation = a3;
}

- (void)setHasOptInButtonLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOptInButtonLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasOptInButtonLocationId
{
  return self->_optInButtonLocationId != 0;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBOptInButtonExposure;
  v4 = [(NTPBOptInButtonExposure *)&v8 description];
  v5 = [(NTPBOptInButtonExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_optInButtonType];
    [v3 setObject:v5 forKey:@"opt_in_button_type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithInt:self->_optInButtonLocation];
    [v3 setObject:v6 forKey:@"opt_in_button_location"];
  }
  optInButtonLocationId = self->_optInButtonLocationId;
  if (optInButtonLocationId) {
    [v3 setObject:optInButtonLocationId forKey:@"opt_in_button_location_id"];
  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v3 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBOptInButtonExposureReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_optInButtonLocationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_groupViewExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_optInButtonType;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_optInButtonLocation;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_optInButtonLocationId copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  uint64_t v10 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  v11 = (void *)v6[1];
  v6[1] = v10;

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
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_optInButtonType != *((_DWORD *)v4 + 8)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_optInButtonLocation != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_16;
  }
  optInButtonLocationId = self->_optInButtonLocationId;
  if ((unint64_t)optInButtonLocationId | *((void *)v4 + 3)
    && !-[NSString isEqual:](optInButtonLocationId, "isEqual:"))
  {
    goto LABEL_16;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 1)) {
    char v7 = -[NSData isEqual:](groupViewExposureId, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_optInButtonType;
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
  uint64_t v4 = 2654435761 * self->_optInButtonLocation;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_optInButtonLocationId hash];
  return v5 ^ [(NSData *)self->_groupViewExposureId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_optInButtonType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if (v5)
  {
    self->_optInButtonLocation = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[NTPBOptInButtonExposure setOptInButtonLocationId:](self, "setOptInButtonLocationId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBOptInButtonExposure setGroupViewExposureId:](self, "setGroupViewExposureId:");
    id v4 = v6;
  }
}

- (NSString)optInButtonLocationId
{
  return self->_optInButtonLocationId;
}

- (void)setOptInButtonLocationId:(id)a3
{
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optInButtonLocationId, 0);

  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
}

@end