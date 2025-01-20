@interface SIRINLUEXTERNALAsrAlternative
- (BOOL)hasAlternative;
- (BOOL)hasProbability;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)alternative;
- (SIRICOMMONFloatValue)probability;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlternative:(id)a3;
- (void)setProbability:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALAsrAlternative

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probability, 0);
  objc_storeStrong((id *)&self->_alternative, 0);
}

- (void)setProbability:(id)a3
{
}

- (SIRICOMMONFloatValue)probability
{
  return self->_probability;
}

- (void)setAlternative:(id)a3
{
}

- (NSString)alternative
{
  return self->_alternative;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[1])
  {
    -[SIRINLUEXTERNALAsrAlternative setAlternative:](self, "setAlternative:");
    v4 = v7;
  }
  probability = self->_probability;
  uint64_t v6 = v4[2];
  if (probability)
  {
    if (v6) {
      -[SIRICOMMONFloatValue mergeFrom:](probability, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALAsrAlternative setProbability:](self, "setProbability:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_alternative hash];
  return [(SIRICOMMONFloatValue *)self->_probability hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((alternative = self->_alternative, !((unint64_t)alternative | v4[1]))
     || -[NSString isEqual:](alternative, "isEqual:")))
  {
    probability = self->_probability;
    if ((unint64_t)probability | v4[2]) {
      char v7 = -[SIRICOMMONFloatValue isEqual:](probability, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_alternative copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(SIRICOMMONFloatValue *)self->_probability copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_alternative)
  {
    objc_msgSend(v4, "setAlternative:");
    id v4 = v5;
  }
  if (self->_probability)
  {
    objc_msgSend(v5, "setProbability:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_alternative)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_probability)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALAsrAlternativeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  alternative = self->_alternative;
  if (alternative) {
    [v3 setObject:alternative forKey:@"alternative"];
  }
  probability = self->_probability;
  if (probability)
  {
    char v7 = [(SIRICOMMONFloatValue *)probability dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"probability"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALAsrAlternative;
  id v4 = [(SIRINLUEXTERNALAsrAlternative *)&v8 description];
  id v5 = [(SIRINLUEXTERNALAsrAlternative *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasProbability
{
  return self->_probability != 0;
}

- (BOOL)hasAlternative
{
  return self->_alternative != 0;
}

@end