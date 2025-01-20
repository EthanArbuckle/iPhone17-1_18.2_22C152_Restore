@interface FCCKPRecordReference
- (BOOL)hasRecordIdentifier;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (FCCKPRecordIdentifier)recordIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)type;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPRecordReference

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRecordReference;
  v4 = [(FCCKPRecordReference *)&v8 description];
  v5 = [(FCCKPRecordReference *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_type];
    [v3 setObject:v4 forKey:@"type"];
  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    v6 = [(FCCKPRecordIdentifier *)recordIdentifier dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"recordIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRecordReferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_recordIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  id v7 = [(FCCKPRecordIdentifier *)self->_recordIdentifier copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  recordIdentifier = self->_recordIdentifier;
  if ((unint64_t)recordIdentifier | *((void *)v4 + 1)) {
    char v6 = -[FCCKPRecordIdentifier isEqual:](recordIdentifier, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_type;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(FCCKPRecordIdentifier *)self->_recordIdentifier hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 20))
  {
    self->_type = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  recordIdentifier = self->_recordIdentifier;
  id v7 = (void *)v5[1];
  if (recordIdentifier)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_super v8 = v5;
    -[FCCKPRecordIdentifier mergeFrom:]((uint64_t)recordIdentifier, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_super v8 = v5;
    [(FCCKPRecordReference *)self setRecordIdentifier:v7];
  }
  uint64_t v5 = v8;
LABEL_9:
}

- (FCCKPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end