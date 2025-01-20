@interface AWDCoreRoutineDeletionRecordStats
- (BOOL)hasAgeInDays;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)ageInDays;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAgeInDays:(unsigned int)a3;
- (void)setHasAgeInDays:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineDeletionRecordStats

- (void)setAgeInDays:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ageInDays = a3;
}

- (void)setHasAgeInDays:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAgeInDays
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineDeletionRecordStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineDeletionRecordStats description](&v3, sel_description), -[AWDCoreRoutineDeletionRecordStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ageInDays] forKey:@"ageInDays"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineDeletionRecordStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_ageInDays;
    *((unsigned char *)a3 + 12) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_ageInDays;
    *((unsigned char *)result + 12) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    LOBYTE(v5) = (*((unsigned char *)a3 + 12) & 1) == 0;
    if (*(unsigned char *)&self->_has) {
      LOBYTE(v5) = (*((unsigned char *)a3 + 12) & 1) != 0 && self->_ageInDays == *((_DWORD *)a3 + 2);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_ageInDays;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 12))
  {
    self->_ageInDays = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unsigned)ageInDays
{
  return self->_ageInDays;
}

@end