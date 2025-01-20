@interface SIRINLUEXTERNALUsoEdgeLabel
- (BOOL)hasBaseEdgeLabel;
- (BOOL)hasEnumeration;
- (BOOL)hasUsoElementId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALUsoLabel)baseEdgeLabel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)enumeration;
- (unsigned)usoElementId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBaseEdgeLabel:(id)a3;
- (void)setEnumeration:(unsigned int)a3;
- (void)setHasEnumeration:(BOOL)a3;
- (void)setHasUsoElementId:(BOOL)a3;
- (void)setUsoElementId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUsoEdgeLabel

- (void).cxx_destruct
{
}

- (void)setBaseEdgeLabel:(id)a3
{
}

- (SIRINLUEXTERNALUsoLabel)baseEdgeLabel
{
  return self->_baseEdgeLabel;
}

- (unsigned)enumeration
{
  return self->_enumeration;
}

- (void)mergeFrom:(id)a3
{
  v4 = (unsigned int *)a3;
  v5 = v4;
  char v6 = *((unsigned char *)v4 + 24);
  if ((v6 & 2) != 0)
  {
    self->_usoElementId = v4[5];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 24);
  }
  if (v6)
  {
    self->_enumeration = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  baseEdgeLabel = self->_baseEdgeLabel;
  uint64_t v8 = *((void *)v5 + 1);
  if (baseEdgeLabel)
  {
    if (v8) {
      -[SIRINLUEXTERNALUsoLabel mergeFrom:](baseEdgeLabel, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALUsoEdgeLabel setBaseEdgeLabel:](self, "setBaseEdgeLabel:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_usoElementId;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(SIRINLUEXTERNALUsoLabel *)self->_baseEdgeLabel hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_enumeration;
  return v3 ^ v2 ^ [(SIRINLUEXTERNALUsoLabel *)self->_baseEdgeLabel hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_usoElementId != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_enumeration != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  baseEdgeLabel = self->_baseEdgeLabel;
  if ((unint64_t)baseEdgeLabel | *((void *)v4 + 1)) {
    char v6 = -[SIRINLUEXTERNALUsoLabel isEqual:](baseEdgeLabel, "isEqual:");
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
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_usoElementId;
    *(unsigned char *)(v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_enumeration;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  id v8 = [(SIRINLUEXTERNALUsoLabel *)self->_baseEdgeLabel copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_usoElementId;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[4] = self->_enumeration;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_baseEdgeLabel)
  {
    char v6 = v4;
    objc_msgSend(v4, "setBaseEdgeLabel:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_baseEdgeLabel)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUsoEdgeLabelReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v5 = [NSNumber numberWithUnsignedInt:self->_usoElementId];
    [v3 setObject:v5 forKey:@"uso_element_id"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v6 = [NSNumber numberWithUnsignedInt:self->_enumeration];
    [v3 setObject:v6 forKey:@"enumeration"];
  }
  baseEdgeLabel = self->_baseEdgeLabel;
  if (baseEdgeLabel)
  {
    id v8 = [(SIRINLUEXTERNALUsoLabel *)baseEdgeLabel dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"base_edge_label"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUsoEdgeLabel;
  id v4 = [(SIRINLUEXTERNALUsoEdgeLabel *)&v8 description];
  uint64_t v5 = [(SIRINLUEXTERNALUsoEdgeLabel *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBaseEdgeLabel
{
  return self->_baseEdgeLabel != 0;
}

- (BOOL)hasEnumeration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasEnumeration:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setEnumeration:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_enumeration = a3;
}

- (BOOL)hasUsoElementId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasUsoElementId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setUsoElementId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_usoElementId = a3;
}

- (unsigned)usoElementId
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_usoElementId;
  }
  else {
    return 0;
  }
}

@end