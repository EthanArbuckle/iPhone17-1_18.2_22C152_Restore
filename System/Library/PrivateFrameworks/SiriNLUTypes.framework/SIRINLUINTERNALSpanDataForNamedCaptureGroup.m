@interface SIRINLUINTERNALSpanDataForNamedCaptureGroup
- (BOOL)hasLabel;
- (BOOL)hasTargetNodeIdx;
- (BOOL)hasTargetUdaIdx;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)label;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)targetNodeIdx;
- (int)targetUdaIdx;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTargetNodeIdx:(BOOL)a3;
- (void)setHasTargetUdaIdx:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setTargetNodeIdx:(int)a3;
- (void)setTargetUdaIdx:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALSpanDataForNamedCaptureGroup

- (void).cxx_destruct
{
}

- (int)targetUdaIdx
{
  return self->_targetUdaIdx;
}

- (int)targetNodeIdx
{
  return self->_targetNodeIdx;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  if (*((void *)v4 + 1))
  {
    v6 = v4;
    -[SIRINLUINTERNALSpanDataForNamedCaptureGroup setLabel:](self, "setLabel:");
    v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_targetNodeIdx = v4[4];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if ((v5 & 2) != 0)
  {
    self->_targetUdaIdx = v4[5];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_targetNodeIdx;
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
  uint64_t v5 = 2654435761 * self->_targetUdaIdx;
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  label = self->_label;
  if ((unint64_t)label | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](label, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_targetNodeIdx != *((_DWORD *)v4 + 4)) {
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
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_targetUdaIdx != *((_DWORD *)v4 + 5)) {
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
  uint64_t v6 = [(NSString *)self->_label copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_targetNodeIdx;
    *(unsigned char *)(v5 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_targetUdaIdx;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_label)
  {
    id v6 = v4;
    objc_msgSend(v4, "setLabel:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_targetNodeIdx;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_targetUdaIdx;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_label)
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
  return SIRINLUINTERNALSpanDataForNamedCaptureGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithInt:self->_targetNodeIdx];
    [v4 setObject:v7 forKey:@"target_node_idx"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v8 = [NSNumber numberWithInt:self->_targetUdaIdx];
    [v4 setObject:v8 forKey:@"target_uda_idx"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALSpanDataForNamedCaptureGroup;
  id v4 = [(SIRINLUINTERNALSpanDataForNamedCaptureGroup *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALSpanDataForNamedCaptureGroup *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasTargetUdaIdx
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTargetUdaIdx:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTargetUdaIdx:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_targetUdaIdx = a3;
}

- (BOOL)hasTargetNodeIdx
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTargetNodeIdx:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTargetNodeIdx:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_targetNodeIdx = a3;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

@end