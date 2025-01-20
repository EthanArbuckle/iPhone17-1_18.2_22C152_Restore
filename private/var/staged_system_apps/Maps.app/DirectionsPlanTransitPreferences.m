@interface DirectionsPlanTransitPreferences
- (BOOL)avoidBusRoutes;
- (BOOL)avoidFerryRoutes;
- (BOOL)avoidMetroLightRailRoutes;
- (BOOL)avoidRailRoutes;
- (BOOL)hasAvoidBusRoutes;
- (BOOL)hasAvoidFerryRoutes;
- (BOOL)hasAvoidMetroLightRailRoutes;
- (BOOL)hasAvoidRailRoutes;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DirectionsPlanTransitPreferences)initWithGEOTransitOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)avoidedTransitModes;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvoidBusRoutes:(BOOL)a3;
- (void)setAvoidFerryRoutes:(BOOL)a3;
- (void)setAvoidMetroLightRailRoutes:(BOOL)a3;
- (void)setAvoidRailRoutes:(BOOL)a3;
- (void)setHasAvoidBusRoutes:(BOOL)a3;
- (void)setHasAvoidFerryRoutes:(BOOL)a3;
- (void)setHasAvoidMetroLightRailRoutes:(BOOL)a3;
- (void)setHasAvoidRailRoutes:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation DirectionsPlanTransitPreferences

- (DirectionsPlanTransitPreferences)initWithGEOTransitOptions:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DirectionsPlanTransitPreferences;
  v5 = [(DirectionsPlanTransitPreferences *)&v8 init];
  if (v5 && [v4 avoidedModesCount])
  {
    unint64_t v6 = 0;
    do
    {
      switch(*((_DWORD *)[v4 avoidedModes] + v6))
      {
        case 1:
        case 3:
          [(DirectionsPlanTransitPreferences *)v5 setAvoidMetroLightRailRoutes:1];
          break;
        case 2:
          [(DirectionsPlanTransitPreferences *)v5 setAvoidRailRoutes:1];
          break;
        case 4:
          [(DirectionsPlanTransitPreferences *)v5 setAvoidBusRoutes:1];
          break;
        case 5:
          [(DirectionsPlanTransitPreferences *)v5 setAvoidFerryRoutes:1];
          break;
        default:
          break;
      }
      ++v6;
    }
    while (v6 < (unint64_t)[v4 avoidedModesCount]);
  }

  return v5;
}

- (unint64_t)avoidedTransitModes
{
  unint64_t v3 = [(DirectionsPlanTransitPreferences *)self avoidBusRoutes];
  if ([(DirectionsPlanTransitPreferences *)self avoidMetroLightRailRoutes]) {
    v3 |= 2uLL;
  }
  if ([(DirectionsPlanTransitPreferences *)self avoidRailRoutes]) {
    v3 |= 4uLL;
  }
  if ([(DirectionsPlanTransitPreferences *)self avoidFerryRoutes]) {
    return v3 | 8;
  }
  else {
    return v3;
  }
}

- (void)setAvoidBusRoutes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_avoidBusRoutes = a3;
}

- (void)setHasAvoidBusRoutes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAvoidBusRoutes
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAvoidMetroLightRailRoutes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_avoidMetroLightRailRoutes = a3;
}

- (void)setHasAvoidMetroLightRailRoutes:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAvoidMetroLightRailRoutes
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAvoidRailRoutes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_avoidRailRoutes = a3;
}

- (void)setHasAvoidRailRoutes:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasAvoidRailRoutes
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAvoidFerryRoutes:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_avoidFerryRoutes = a3;
}

- (void)setHasAvoidFerryRoutes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAvoidFerryRoutes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)DirectionsPlanTransitPreferences;
  char v3 = [(DirectionsPlanTransitPreferences *)&v7 description];
  id v4 = [(DirectionsPlanTransitPreferences *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithBool:self->_avoidBusRoutes];
    [v3 setObject:v7 forKey:@"avoidBusRoutes"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = +[NSNumber numberWithBool:self->_avoidMetroLightRailRoutes];
  [v3 setObject:v8 forKey:@"avoidMetroLightRailRoutes"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = +[NSNumber numberWithBool:self->_avoidRailRoutes];
  [v3 setObject:v9 forKey:@"avoidRailRoutes"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v5 = +[NSNumber numberWithBool:self->_avoidFerryRoutes];
    [v3 setObject:v5 forKey:@"avoidFerryRoutes"];
  }
LABEL_6:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100A24844((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteBOOLField();
LABEL_6:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[8] = self->_avoidBusRoutes;
    v4[12] |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[10] = self->_avoidMetroLightRailRoutes;
  v4[12] |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v4[11] = self->_avoidRailRoutes;
  v4[12] |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v4[9] = self->_avoidFerryRoutes;
    v4[12] |= 2u;
  }
LABEL_6:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if (has)
  {
    *((unsigned char *)result + 8) = self->_avoidBusRoutes;
    *((unsigned char *)result + 12) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 10) = self->_avoidMetroLightRailRoutes;
  *((unsigned char *)result + 12) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((unsigned char *)result + 11) = self->_avoidRailRoutes;
  *((unsigned char *)result + 12) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_5:
  *((unsigned char *)result + 9) = self->_avoidFerryRoutes;
  *((unsigned char *)result + 12) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_28;
    }
    if (self->_avoidBusRoutes)
    {
      if (!v4[8]) {
        goto LABEL_28;
      }
    }
    else if (v4[8])
    {
      goto LABEL_28;
    }
  }
  else if (v4[12])
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[12] & 4) == 0) {
      goto LABEL_28;
    }
    if (self->_avoidMetroLightRailRoutes)
    {
      if (!v4[10]) {
        goto LABEL_28;
      }
    }
    else if (v4[10])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[12] & 4) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[12] & 8) == 0) {
      goto LABEL_28;
    }
    if (self->_avoidRailRoutes)
    {
      if (!v4[11]) {
        goto LABEL_28;
      }
    }
    else if (v4[11])
    {
      goto LABEL_28;
    }
  }
  else if ((v4[12] & 8) != 0)
  {
    goto LABEL_28;
  }
  BOOL v5 = (v4[12] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_avoidFerryRoutes)
      {
        if (!v4[9]) {
          goto LABEL_28;
        }
      }
      else if (v4[9])
      {
        goto LABEL_28;
      }
      BOOL v5 = 1;
      goto LABEL_29;
    }
LABEL_28:
    BOOL v5 = 0;
  }
LABEL_29:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_avoidBusRoutes;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_avoidMetroLightRailRoutes;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_avoidRailRoutes;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_avoidFerryRoutes;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  BOOL v5 = v4[12];
  if (v5)
  {
    self->_avoidBusRoutes = v4[8];
    *(unsigned char *)&self->_has |= 1u;
    BOOL v5 = v4[12];
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((v4[12] & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_avoidMetroLightRailRoutes = v4[10];
  *(unsigned char *)&self->_has |= 4u;
  BOOL v5 = v4[12];
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_avoidRailRoutes = v4[11];
  *(unsigned char *)&self->_has |= 8u;
  if ((v4[12] & 2) != 0)
  {
LABEL_5:
    self->_avoidFerryRoutes = v4[9];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
}

- (BOOL)avoidBusRoutes
{
  return self->_avoidBusRoutes;
}

- (BOOL)avoidMetroLightRailRoutes
{
  return self->_avoidMetroLightRailRoutes;
}

- (BOOL)avoidRailRoutes
{
  return self->_avoidRailRoutes;
}

- (BOOL)avoidFerryRoutes
{
  return self->_avoidFerryRoutes;
}

@end