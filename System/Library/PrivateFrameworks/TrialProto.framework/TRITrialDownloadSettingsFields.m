@interface TRITrialDownloadSettingsFields
- (BOOL)allowAnyNetworking;
- (BOOL)allowBattery;
- (BOOL)hasAllowAnyNetworking;
- (BOOL)hasAllowBattery;
- (BOOL)hasDiscretionaryBehavior;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)discretionaryBehaviorAsString:(int)a3;
- (int)StringAsDiscretionaryBehavior:(id)a3;
- (int)discretionaryBehavior;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllowAnyNetworking:(BOOL)a3;
- (void)setAllowBattery:(BOOL)a3;
- (void)setDiscretionaryBehavior:(int)a3;
- (void)setHasAllowAnyNetworking:(BOOL)a3;
- (void)setHasAllowBattery:(BOOL)a3;
- (void)setHasDiscretionaryBehavior:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRITrialDownloadSettingsFields

- (void)setAllowAnyNetworking:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_allowAnyNetworking = a3;
}

- (void)setHasAllowAnyNetworking:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAllowAnyNetworking
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAllowBattery:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_allowBattery = a3;
}

- (void)setHasAllowBattery:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAllowBattery
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)discretionaryBehavior
{
  if (*(unsigned char *)&self->_has) {
    return self->_discretionaryBehavior;
  }
  else {
    return 0;
  }
}

- (void)setDiscretionaryBehavior:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_discretionaryBehavior = a3;
}

- (void)setHasDiscretionaryBehavior:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDiscretionaryBehavior
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)discretionaryBehaviorAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E576BEC0[a3];
  }
  return v3;
}

- (int)StringAsDiscretionaryBehavior:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_BEHAVIOR"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DISCRETIONARY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NON_DISCRETIONARY"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRITrialDownloadSettingsFields;
  int v4 = [(TRITrialDownloadSettingsFields *)&v8 description];
  v5 = [(TRITrialDownloadSettingsFields *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    v6 = [NSNumber numberWithBool:self->_allowBattery];
    [v3 setObject:v6 forKey:@"allow_battery"];

    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_11;
    }
LABEL_7:
    uint64_t discretionaryBehavior = self->_discretionaryBehavior;
    if (discretionaryBehavior >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_discretionaryBehavior);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E576BEC0[discretionaryBehavior];
    }
    [v3 setObject:v8 forKey:@"discretionary_behavior"];

    goto LABEL_11;
  }
  v5 = [NSNumber numberWithBool:self->_allowAnyNetworking];
  [v3 setObject:v5 forKey:@"allow_any_networking"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (has) {
    goto LABEL_7;
  }
LABEL_11:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRITrialDownloadSettingsFieldsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
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
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[12] = self->_allowAnyNetworking;
    v4[16] |= 2u;
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
  v4[13] = self->_allowBattery;
  v4[16] |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((_DWORD *)v4 + 2) = self->_discretionaryBehavior;
    v4[16] |= 1u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 12) = self->_allowAnyNetworking;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 13) = self->_allowBattery;
  *((unsigned char *)result + 16) |= 4u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_discretionaryBehavior;
  *((unsigned char *)result + 16) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0) {
      goto LABEL_22;
    }
    if (self->_allowAnyNetworking)
    {
      if (!*((unsigned char *)v4 + 12)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)v4 + 12))
    {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 4) != 0)
    {
      if (self->_allowBattery)
      {
        if (!*((unsigned char *)v4 + 13)) {
          goto LABEL_22;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 13)) {
        goto LABEL_18;
      }
    }
LABEL_22:
    BOOL v5 = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 16) & 4) != 0) {
    goto LABEL_22;
  }
LABEL_18:
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_discretionaryBehavior != *((_DWORD *)v4 + 2)) {
      goto LABEL_22;
    }
    BOOL v5 = 1;
  }
LABEL_23:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_allowAnyNetworking;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_allowBattery;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_discretionaryBehavior;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_allowAnyNetworking = *((unsigned char *)v4 + 12);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_allowBattery = *((unsigned char *)v4 + 13);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 16))
  {
LABEL_4:
    self->_uint64_t discretionaryBehavior = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
}

- (BOOL)allowAnyNetworking
{
  return self->_allowAnyNetworking;
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

@end