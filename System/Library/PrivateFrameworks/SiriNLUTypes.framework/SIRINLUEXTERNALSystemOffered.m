@interface SIRINLUEXTERNALSystemOffered
- (BOOL)hasOfferedAct;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALUserDialogAct)offeredAct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setOfferedAct:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSystemOffered

- (void).cxx_destruct
{
}

- (void)setOfferedAct:(id)a3
{
}

- (SIRINLUEXTERNALUserDialogAct)offeredAct
{
  return self->_offeredAct;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  offeredAct = self->_offeredAct;
  uint64_t v6 = v4[1];
  if (offeredAct)
  {
    if (v6) {
      -[SIRINLUEXTERNALUserDialogAct mergeFrom:](offeredAct, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALSystemOffered setOfferedAct:](self, "setOfferedAct:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  return [(SIRINLUEXTERNALUserDialogAct *)self->_offeredAct hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    offeredAct = self->_offeredAct;
    if ((unint64_t)offeredAct | v4[1]) {
      char v6 = -[SIRINLUEXTERNALUserDialogAct isEqual:](offeredAct, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUserDialogAct *)self->_offeredAct copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  offeredAct = self->_offeredAct;
  if (offeredAct) {
    [a3 setOfferedAct:offeredAct];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_offeredAct) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSystemOfferedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  offeredAct = self->_offeredAct;
  if (offeredAct)
  {
    v5 = [(SIRINLUEXTERNALUserDialogAct *)offeredAct dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"offered_act"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSystemOffered;
  v4 = [(SIRINLUEXTERNALSystemOffered *)&v8 description];
  v5 = [(SIRINLUEXTERNALSystemOffered *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasOfferedAct
{
  return self->_offeredAct != 0;
}

@end