@interface SIRINLUEXTERNALUsoEdge
- (BOOL)hasFromIndex;
- (BOOL)hasLabel;
- (BOOL)hasToIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALUsoEdgeLabel)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)fromIndex;
- (unsigned)toIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFromIndex:(unsigned int)a3;
- (void)setHasFromIndex:(BOOL)a3;
- (void)setHasToIndex:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setToIndex:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUsoEdge

- (void).cxx_destruct
{
}

- (void)setLabel:(id)a3
{
}

- (SIRINLUEXTERNALUsoEdgeLabel)label
{
  return self->_label;
}

- (void)mergeFrom:(id)a3
{
  v4 = (unsigned int *)a3;
  v5 = v4;
  char v6 = *((unsigned char *)v4 + 28);
  if (v6)
  {
    self->_fromIndex = v4[2];
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 28);
  }
  if ((v6 & 2) != 0)
  {
    self->_toIndex = v4[6];
    *(unsigned char *)&self->_has |= 2u;
  }
  label = self->_label;
  uint64_t v8 = *((void *)v5 + 2);
  if (label)
  {
    if (v8) {
      -[SIRINLUEXTERNALUsoEdgeLabel mergeFrom:](label, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALUsoEdge setLabel:](self, "setLabel:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_fromIndex;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(SIRINLUEXTERNALUsoEdgeLabel *)self->_label hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_toIndex;
  return v3 ^ v2 ^ [(SIRINLUEXTERNALUsoEdgeLabel *)self->_label hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_fromIndex != *((_DWORD *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_toIndex != *((_DWORD *)v4 + 6)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 2)) {
    char v6 = -[SIRINLUEXTERNALUsoEdgeLabel isEqual:](label, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_fromIndex;
    *(unsigned char *)(v5 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_toIndex;
    *(unsigned char *)(v5 + 28) |= 2u;
  }
  id v8 = [(SIRINLUEXTERNALUsoEdgeLabel *)self->_label copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_fromIndex;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[6] = self->_toIndex;
    *((unsigned char *)v4 + 28) |= 2u;
  }
  if (self->_label)
  {
    char v6 = v4;
    objc_msgSend(v4, "setLabel:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_label)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoEdgeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedInt:self->_fromIndex];
    [v3 setObject:v5 forKey:@"from_index"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    id v6 = [NSNumber numberWithUnsignedInt:self->_toIndex];
    [v3 setObject:v6 forKey:@"to_index"];
  }
  label = self->_label;
  if (label)
  {
    id v8 = [(SIRINLUEXTERNALUsoEdgeLabel *)label dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"label"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUsoEdge;
  id v4 = [(SIRINLUEXTERNALUsoEdge *)&v8 description];
  uint64_t v5 = [(SIRINLUEXTERNALUsoEdge *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (BOOL)hasToIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasToIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setToIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_toIndex = a3;
}

- (unsigned)toIndex
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_toIndex;
  }
  else {
    return 0;
  }
}

- (BOOL)hasFromIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasFromIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setFromIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fromIndex = a3;
}

- (unsigned)fromIndex
{
  if (*(unsigned char *)&self->_has) {
    return self->_fromIndex;
  }
  else {
    return 0;
  }
}

@end