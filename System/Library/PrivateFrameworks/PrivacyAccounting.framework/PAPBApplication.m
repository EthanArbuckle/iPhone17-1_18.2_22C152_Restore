@interface PAPBApplication
- (BOOL)hasIdentifier;
- (BOOL)hasIdentifierType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)identifierType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasIdentifierType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentifierType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PAPBApplication

- (int)identifierType
{
  if (*(unsigned char *)&self->_has) {
    return self->_identifierType;
  }
  else {
    return 0;
  }
}

- (void)setIdentifierType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_identifierType = a3;
}

- (void)setHasIdentifierType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIdentifierType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PAPBApplication;
  v4 = [(PAPBApplication *)&v8 description];
  v5 = [(PAPBApplication *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithInt:self->_identifierType];
    [v3 setObject:v4 forKeyedSubscript:@"identifierType"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKeyedSubscript:@"identifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PAPBApplicationReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_identifierType;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_identifier copyWithZone:a3];
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
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_identifierType != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](identifier, "isEqual:");
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
    uint64_t v2 = 2654435761 * self->_identifierType;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSString *)self->_identifier hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[5])
  {
    self->_identifierType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[PAPBApplication setIdentifier:](self, "setIdentifier:");
    id v4 = v5;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end