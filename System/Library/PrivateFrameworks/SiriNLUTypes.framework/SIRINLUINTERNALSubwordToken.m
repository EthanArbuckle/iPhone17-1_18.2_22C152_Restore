@interface SIRINLUINTERNALSubwordToken
- (BOOL)hasSubwordTokenIndex;
- (BOOL)hasTokenIndex;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)subwordTokenIndex;
- (int)tokenIndex;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSubwordTokenIndex:(BOOL)a3;
- (void)setHasTokenIndex:(BOOL)a3;
- (void)setSubwordTokenIndex:(int)a3;
- (void)setTokenIndex:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSubwordToken

- (void).cxx_destruct
{
}

- (int)tokenIndex
{
  return self->_tokenIndex;
}

- (int)subwordTokenIndex
{
  return self->_subwordTokenIndex;
}

- (void)setValue:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  if (*((void *)v4 + 2))
  {
    v6 = v4;
    -[SIRINLUINTERNALSubwordToken setValue:](self, "setValue:");
    v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_subwordTokenIndex = v4[2];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_tokenIndex = v4[3];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_value hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_subwordTokenIndex;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_tokenIndex;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](value, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_subwordTokenIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_tokenIndex != *((_DWORD *)v4 + 3)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_value copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_subwordTokenIndex;
    *(unsigned char *)(v5 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_tokenIndex;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_value)
  {
    id v6 = v4;
    objc_msgSend(v4, "setValue:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 2) = self->_subwordTokenIndex;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 3) = self->_tokenIndex;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_value)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSubwordTokenReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithInt:self->_subwordTokenIndex];
    [v4 setObject:v7 forKey:@"subword_token_index"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = [NSNumber numberWithInt:self->_tokenIndex];
    [v4 setObject:v8 forKey:@"token_index"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSubwordToken;
  id v4 = [(SIRINLUINTERNALSubwordToken *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALSubwordToken *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTokenIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTokenIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTokenIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_tokenIndex = a3;
}

- (BOOL)hasSubwordTokenIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSubwordTokenIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSubwordTokenIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_subwordTokenIndex = a3;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

@end