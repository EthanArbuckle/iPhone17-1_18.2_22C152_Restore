@interface SIRINLUINTERNALMDSUaaPParseOverride
- (BOOL)hasParseOverride;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUINTERNALParseOverride)parseOverride;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setParseOverride:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALMDSUaaPParseOverride

- (void).cxx_destruct
{
}

- (void)setParseOverride:(id)a3
{
}

- (SIRINLUINTERNALParseOverride)parseOverride
{
  return self->_parseOverride;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  parseOverride = self->_parseOverride;
  uint64_t v6 = v4[1];
  if (parseOverride)
  {
    if (v6) {
      -[SIRINLUINTERNALParseOverride mergeFrom:](parseOverride, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUINTERNALMDSUaaPParseOverride setParseOverride:](self, "setParseOverride:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  return [(SIRINLUINTERNALParseOverride *)self->_parseOverride hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    parseOverride = self->_parseOverride;
    if ((unint64_t)parseOverride | v4[1]) {
      char v6 = -[SIRINLUINTERNALParseOverride isEqual:](parseOverride, "isEqual:");
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
  id v6 = [(SIRINLUINTERNALParseOverride *)self->_parseOverride copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  parseOverride = self->_parseOverride;
  if (parseOverride) {
    [a3 setParseOverride:parseOverride];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_parseOverride) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALMDSUaaPParseOverrideReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  parseOverride = self->_parseOverride;
  if (parseOverride)
  {
    v5 = [(SIRINLUINTERNALParseOverride *)parseOverride dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"parse_override"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALMDSUaaPParseOverride;
  v4 = [(SIRINLUINTERNALMDSUaaPParseOverride *)&v8 description];
  v5 = [(SIRINLUINTERNALMDSUaaPParseOverride *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasParseOverride
{
  return self->_parseOverride != 0;
}

@end