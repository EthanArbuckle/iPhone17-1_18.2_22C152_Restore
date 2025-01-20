@interface AWDCoreRoutineMagicalMomentsFeatureAddon
- (BOOL)hasName;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)value;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setValue:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineMagicalMomentsFeatureAddon

- (void)dealloc
{
  [(AWDCoreRoutineMagicalMomentsFeatureAddon *)self setName:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsFeatureAddon;
  [(AWDCoreRoutineMagicalMomentsFeatureAddon *)&v3 dealloc];
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setValue:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsFeatureAddon;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineMagicalMomentsFeatureAddon description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsFeatureAddon dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if (*(unsigned char *)&self->_has) {
    [v4 setObject:[NSNumber numberWithInt:self->_value] forKey:@"value"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsFeatureAddonReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_name) {
    [a3 setName:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 4) = self->_value;
    *((unsigned char *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];

  *(void *)(v5 + 8) = [(NSString *)self->_name copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_value;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    name = self->_name;
    if (!((unint64_t)name | *((void *)a3 + 1)) || (int v5 = -[NSString isEqual:](name, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) != 0 && self->_value == *((_DWORD *)a3 + 4);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_value;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[AWDCoreRoutineMagicalMomentsFeatureAddon setName:](self, "setName:");
  }
  if (*((unsigned char *)a3 + 20))
  {
    self->_value = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (int)value
{
  return self->_value;
}

@end