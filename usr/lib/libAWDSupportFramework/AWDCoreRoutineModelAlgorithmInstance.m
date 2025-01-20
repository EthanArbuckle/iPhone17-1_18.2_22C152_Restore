@interface AWDCoreRoutineModelAlgorithmInstance
- (BOOL)hasAddressComponentMatches;
- (BOOL)hasDistanceFromTruth;
- (BOOL)hasEfficacy;
- (BOOL)hasIsRotted;
- (BOOL)hasPreviousType;
- (BOOL)hasSource;
- (BOOL)hasTruthSource;
- (BOOL)hasTruthType;
- (BOOL)hasType;
- (BOOL)hasUncertainty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRotted;
- (BOOL)readFrom:(id)a3;
- (double)distanceFromTruth;
- (double)uncertainty;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)addressComponentMatches;
- (unint64_t)hash;
- (unsigned)efficacy;
- (unsigned)previousType;
- (unsigned)source;
- (unsigned)truthSource;
- (unsigned)truthType;
- (unsigned)type;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddressComponentMatches:(unint64_t)a3;
- (void)setDistanceFromTruth:(double)a3;
- (void)setEfficacy:(unsigned int)a3;
- (void)setHasAddressComponentMatches:(BOOL)a3;
- (void)setHasDistanceFromTruth:(BOOL)a3;
- (void)setHasEfficacy:(BOOL)a3;
- (void)setHasIsRotted:(BOOL)a3;
- (void)setHasPreviousType:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasTruthSource:(BOOL)a3;
- (void)setHasTruthType:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setHasUncertainty:(BOOL)a3;
- (void)setIsRotted:(BOOL)a3;
- (void)setPreviousType:(unsigned int)a3;
- (void)setSource:(unsigned int)a3;
- (void)setTruthSource:(unsigned int)a3;
- (void)setTruthType:(unsigned int)a3;
- (void)setType:(unsigned int)a3;
- (void)setUncertainty:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineModelAlgorithmInstance

- (void)setType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEfficacy:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_efficacy = a3;
}

- (void)setHasEfficacy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEfficacy
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSource:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSource
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setUncertainty:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_uncertainty = a3;
}

- (void)setHasUncertainty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasUncertainty
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDistanceFromTruth:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_distanceFromTruth = a3;
}

- (void)setHasDistanceFromTruth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDistanceFromTruth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAddressComponentMatches:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_addressComponentMatches = a3;
}

- (void)setHasAddressComponentMatches:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAddressComponentMatches
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPreviousType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_previousType = a3;
}

- (void)setHasPreviousType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPreviousType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTruthType:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_truthType = a3;
}

- (void)setHasTruthType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTruthType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTruthSource:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_truthSource = a3;
}

- (void)setHasTruthSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTruthSource
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsRotted:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isRotted = a3;
}

- (void)setHasIsRotted:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsRotted
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineModelAlgorithmInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineModelAlgorithmInstance description](&v3, sel_description), -[AWDCoreRoutineModelAlgorithmInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_type] forKey:@"type"];
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_efficacy] forKey:@"efficacy"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_source] forKey:@"source"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithDouble:self->_uncertainty] forKey:@"uncertainty"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithDouble:self->_distanceFromTruth] forKey:@"distanceFromTruth"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_addressComponentMatches] forKey:@"addressComponentMatches"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_previousType] forKey:@"previousType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
LABEL_21:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_truthSource] forKey:@"truthSource"];
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return v3;
    }
    goto LABEL_11;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_truthType] forKey:@"truthType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_21;
  }
LABEL_10:
  if ((has & 0x200) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_isRotted] forKey:@"isRotted"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineModelAlgorithmInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0) {
    goto LABEL_20;
  }
LABEL_10:
  if ((has & 0x200) == 0) {
    return;
  }
LABEL_21:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 13) = self->_type;
    *((_WORD *)a3 + 30) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_efficacy;
  *((_WORD *)a3 + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)a3 + 10) = self->_source;
  *((_WORD *)a3 + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)a3 + 3) = *(void *)&self->_uncertainty;
  *((_WORD *)a3 + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)a3 + 2) = *(void *)&self->_distanceFromTruth;
  *((_WORD *)a3 + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)a3 + 1) = self->_addressComponentMatches;
  *((_WORD *)a3 + 30) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 9) = self->_previousType;
  *((_WORD *)a3 + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 12) = self->_truthType;
  *((_WORD *)a3 + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      return;
    }
LABEL_21:
    *((unsigned char *)a3 + 56) = self->_isRotted;
    *((_WORD *)a3 + 30) |= 0x200u;
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 11) = self->_truthSource;
  *((_WORD *)a3 + 30) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    goto LABEL_21;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)result + 13) = self->_type;
    *((_WORD *)result + 30) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_efficacy;
  *((_WORD *)result + 30) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 10) = self->_source;
  *((_WORD *)result + 30) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 3) = *(void *)&self->_uncertainty;
  *((_WORD *)result + 30) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)result + 2) = *(void *)&self->_distanceFromTruth;
  *((_WORD *)result + 30) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((void *)result + 1) = self->_addressComponentMatches;
  *((_WORD *)result + 30) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 9) = self->_previousType;
  *((_WORD *)result + 30) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 12) = self->_truthType;
  *((_WORD *)result + 30) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      return result;
    }
    goto LABEL_11;
  }
LABEL_21:
  *((_DWORD *)result + 11) = self->_truthSource;
  *((_WORD *)result + 30) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    return result;
  }
LABEL_11:
  *((unsigned char *)result + 56) = self->_isRotted;
  *((_WORD *)result + 30) |= 0x200u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 has = (__int16)self->_has;
    __int16 v7 = *((_WORD *)a3 + 30);
    if ((has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 30) & 0x100) == 0 || self->_type != *((_DWORD *)a3 + 13)) {
        goto LABEL_49;
      }
    }
    else if ((*((_WORD *)a3 + 30) & 0x100) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_efficacy != *((_DWORD *)a3 + 8)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_source != *((_DWORD *)a3 + 10)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_uncertainty != *((double *)a3 + 3)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_distanceFromTruth != *((double *)a3 + 2)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_49;
    }
    if (has)
    {
      if ((v7 & 1) == 0 || self->_addressComponentMatches != *((void *)a3 + 1)) {
        goto LABEL_49;
      }
    }
    else if (v7)
    {
      goto LABEL_49;
    }
    if ((has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_previousType != *((_DWORD *)a3 + 9)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_truthType != *((_DWORD *)a3 + 12)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_49;
    }
    if ((has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_truthSource != *((_DWORD *)a3 + 11)) {
        goto LABEL_49;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_49;
    }
    LOBYTE(v5) = (v7 & 0x200) == 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 30) & 0x200) == 0)
      {
LABEL_49:
        LOBYTE(v5) = 0;
        return v5;
      }
      if (self->_isRotted)
      {
        if (!*((unsigned char *)a3 + 56)) {
          goto LABEL_49;
        }
      }
      else if (*((unsigned char *)a3 + 56))
      {
        goto LABEL_49;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v4 = 2654435761 * self->_type;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_efficacy;
      if ((has & 0x20) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v6 = 0;
      if ((has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_source;
  if ((has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double uncertainty = self->_uncertainty;
  double v8 = -uncertainty;
  if (uncertainty >= 0.0) {
    double v8 = self->_uncertainty;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((has & 2) != 0)
  {
    double distanceFromTruth = self->_distanceFromTruth;
    double v14 = -distanceFromTruth;
    if (distanceFromTruth >= 0.0) {
      double v14 = self->_distanceFromTruth;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if (has)
  {
    unint64_t v17 = 2654435761u * self->_addressComponentMatches;
    if ((has & 0x10) != 0)
    {
LABEL_25:
      uint64_t v18 = 2654435761 * self->_previousType;
      if ((has & 0x80) != 0) {
        goto LABEL_26;
      }
      goto LABEL_31;
    }
  }
  else
  {
    unint64_t v17 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_25;
    }
  }
  uint64_t v18 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_26:
    uint64_t v19 = 2654435761 * self->_truthType;
    if ((has & 0x40) != 0) {
      goto LABEL_27;
    }
LABEL_32:
    uint64_t v20 = 0;
    if ((has & 0x200) != 0) {
      goto LABEL_28;
    }
LABEL_33:
    uint64_t v21 = 0;
    return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_31:
  uint64_t v19 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_32;
  }
LABEL_27:
  uint64_t v20 = 2654435761 * self->_truthSource;
  if ((has & 0x200) == 0) {
    goto LABEL_33;
  }
LABEL_28:
  uint64_t v21 = 2654435761 * self->_isRotted;
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x100) != 0)
  {
    self->_type = *((_DWORD *)a3 + 13);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v3 = *((_WORD *)a3 + 30);
    if ((v3 & 8) == 0)
    {
LABEL_3:
      if ((v3 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((v3 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_efficacy = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x20) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_source = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_double uncertainty = *((double *)a3 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 2) == 0)
  {
LABEL_6:
    if ((v3 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_double distanceFromTruth = *((double *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 1) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_addressComponentMatches = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_previousType = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 0x40) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_truthType = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 30);
  if ((v3 & 0x40) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0) {
      return;
    }
LABEL_21:
    self->_isRotted = *((unsigned char *)a3 + 56);
    *(_WORD *)&self->_has |= 0x200u;
    return;
  }
LABEL_20:
  self->_truthSource = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)a3 + 30) & 0x200) != 0) {
    goto LABEL_21;
  }
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)efficacy
{
  return self->_efficacy;
}

- (unsigned)source
{
  return self->_source;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (double)distanceFromTruth
{
  return self->_distanceFromTruth;
}

- (unint64_t)addressComponentMatches
{
  return self->_addressComponentMatches;
}

- (unsigned)previousType
{
  return self->_previousType;
}

- (unsigned)truthType
{
  return self->_truthType;
}

- (unsigned)truthSource
{
  return self->_truthSource;
}

- (BOOL)isRotted
{
  return self->_isRotted;
}

@end