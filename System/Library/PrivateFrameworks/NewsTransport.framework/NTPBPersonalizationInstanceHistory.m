@interface NTPBPersonalizationInstanceHistory
- (BOOL)hasInstanceIdentifier;
- (BOOL)hasLastChangeNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)instanceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)lastChangeNumber;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasLastChangeNumber:(BOOL)a3;
- (void)setInstanceIdentifier:(id)a3;
- (void)setLastChangeNumber:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPersonalizationInstanceHistory

- (void)dealloc
{
  [(NTPBPersonalizationInstanceHistory *)self setInstanceIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationInstanceHistory;
  [(NTPBPersonalizationInstanceHistory *)&v3 dealloc];
}

- (BOOL)hasInstanceIdentifier
{
  return self->_instanceIdentifier != 0;
}

- (void)setLastChangeNumber:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lastChangeNumber = a3;
}

- (void)setHasLastChangeNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastChangeNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationInstanceHistory;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPersonalizationInstanceHistory description](&v3, sel_description), -[NTPBPersonalizationInstanceHistory dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  instanceIdentifier = self->_instanceIdentifier;
  if (instanceIdentifier) {
    [v3 setObject:instanceIdentifier forKey:@"instance_identifier"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_lastChangeNumber), @"last_change_number");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationInstanceHistoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_instanceIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 16) = [(NSString *)self->_instanceIdentifier copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_lastChangeNumber;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    instanceIdentifier = self->_instanceIdentifier;
    if (!((unint64_t)instanceIdentifier | *((void *)a3 + 2))
      || (int v5 = -[NSString isEqual:](instanceIdentifier, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 24) & 1) != 0 && self->_lastChangeNumber == *((void *)a3 + 1);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_instanceIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_lastChangeNumber;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[NTPBPersonalizationInstanceHistory setInstanceIdentifier:](self, "setInstanceIdentifier:");
  }
  if (*((unsigned char *)a3 + 24))
  {
    self->_lastChangeNumber = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (void)setInstanceIdentifier:(id)a3
{
}

- (unint64_t)lastChangeNumber
{
  return self->_lastChangeNumber;
}

@end