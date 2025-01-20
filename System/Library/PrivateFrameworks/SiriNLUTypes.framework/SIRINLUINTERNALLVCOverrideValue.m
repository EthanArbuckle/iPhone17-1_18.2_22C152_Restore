@interface SIRINLUINTERNALLVCOverrideValue
- (BOOL)hasLvcValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALMultilingualVariant)lvcValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLvcValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALLVCOverrideValue

- (void).cxx_destruct
{
}

- (void)setLvcValue:(id)a3
{
}

- (SIRINLUEXTERNALMultilingualVariant)lvcValue
{
  return self->_lvcValue;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  lvcValue = self->_lvcValue;
  uint64_t v6 = v4[1];
  if (lvcValue)
  {
    if (v6) {
      -[SIRINLUEXTERNALMultilingualVariant mergeFrom:](lvcValue, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALLVCOverrideValue setLvcValue:](self, "setLvcValue:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  return [(SIRINLUEXTERNALMultilingualVariant *)self->_lvcValue hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    lvcValue = self->_lvcValue;
    if ((unint64_t)lvcValue | v4[1]) {
      char v6 = -[SIRINLUEXTERNALMultilingualVariant isEqual:](lvcValue, "isEqual:");
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
  id v6 = [(SIRINLUEXTERNALMultilingualVariant *)self->_lvcValue copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  lvcValue = self->_lvcValue;
  if (lvcValue) {
    [a3 setLvcValue:lvcValue];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_lvcValue) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALLVCOverrideValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  lvcValue = self->_lvcValue;
  if (lvcValue)
  {
    v5 = [(SIRINLUEXTERNALMultilingualVariant *)lvcValue dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"lvc_value"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALLVCOverrideValue;
  v4 = [(SIRINLUINTERNALLVCOverrideValue *)&v8 description];
  v5 = [(SIRINLUINTERNALLVCOverrideValue *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLvcValue
{
  return self->_lvcValue != 0;
}

@end