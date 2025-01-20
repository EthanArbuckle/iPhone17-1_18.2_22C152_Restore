@interface AWDCoreRoutineModelClusterMovementInstance
- (BOOL)hasDistance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)distance;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDistance:(unint64_t)a3;
- (void)setHasDistance:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineModelClusterMovementInstance

- (void)setDistance:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDistance
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineModelClusterMovementInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineModelClusterMovementInstance description](&v3, sel_description), -[AWDCoreRoutineModelClusterMovementInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_distance] forKey:@"distance"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineModelClusterMovementInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_distance;
    *((unsigned char *)a3 + 16) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init]];
  if (*(unsigned char *)&self->_has)
  {
    *((void *)result + 1) = self->_distance;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 1) == 0;
    if (*(unsigned char *)&self->_has) {
      LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 1) != 0 && self->_distance == *((void *)a3 + 1);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761u * self->_distance;
  }
  else {
    return 0;
  }
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 16))
  {
    self->_distance = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)distance
{
  return self->_distance;
}

@end