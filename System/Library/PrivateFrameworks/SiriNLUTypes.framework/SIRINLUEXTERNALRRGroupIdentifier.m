@interface SIRINLUEXTERNALRRGroupIdentifier
- (BOOL)hasGroupId;
- (BOOL)hasSeq;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRICOMMONStringValue)groupId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)seq;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setHasSeq:(BOOL)a3;
- (void)setSeq:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALRRGroupIdentifier

- (void).cxx_destruct
{
}

- (int)seq
{
  return self->_seq;
}

- (void)setGroupId:(id)a3
{
}

- (SIRICOMMONStringValue)groupId
{
  return self->_groupId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  groupId = self->_groupId;
  uint64_t v6 = *((void *)v4 + 1);
  if (groupId)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[SIRICOMMONStringValue mergeFrom:](groupId, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[SIRINLUEXTERNALRRGroupIdentifier setGroupId:](self, "setGroupId:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 20))
  {
    self->_seq = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRICOMMONStringValue *)self->_groupId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_seq;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((void *)v4 + 1))
  {
    if (!-[SIRICOMMONStringValue isEqual:](groupId, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_seq == *((_DWORD *)v4 + 4))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRICOMMONStringValue *)self->_groupId copyWithZone:a3];
  id v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_seq;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_groupId)
  {
    id v5 = v4;
    objc_msgSend(v4, "setGroupId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_seq;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_groupId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALRRGroupIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  groupId = self->_groupId;
  if (groupId)
  {
    id v5 = [(SIRICOMMONStringValue *)groupId dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"group_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v6 = [NSNumber numberWithInt:self->_seq];
    [v3 setObject:v6 forKey:@"seq"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALRRGroupIdentifier;
  id v4 = [(SIRINLUEXTERNALRRGroupIdentifier *)&v8 description];
  id v5 = [(SIRINLUEXTERNALRRGroupIdentifier *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasSeq
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasSeq:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setSeq:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_seq = a3;
}

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

@end