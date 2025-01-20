@interface SIRINLUEXTERNALSpanProperty
- (BOOL)hasKey;
- (BOOL)hasValueFloat;
- (BOOL)hasValueInt;
- (BOOL)hasValueString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (SIRICOMMONFloatValue)valueFloat;
- (SIRICOMMONInt32Value)valueInt;
- (SIRICOMMONStringValue)valueString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKey:(id)a3;
- (void)setValueFloat:(id)a3;
- (void)setValueInt:(id)a3;
- (void)setValueString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALSpanProperty

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueString, 0);
  objc_storeStrong((id *)&self->_valueInt, 0);
  objc_storeStrong((id *)&self->_valueFloat, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setValueFloat:(id)a3
{
}

- (SIRICOMMONFloatValue)valueFloat
{
  return self->_valueFloat;
}

- (void)setValueInt:(id)a3
{
}

- (SIRICOMMONInt32Value)valueInt
{
  return self->_valueInt;
}

- (void)setValueString:(id)a3
{
}

- (SIRICOMMONStringValue)valueString
{
  return self->_valueString;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v11 = v4;
  if (v4[1])
  {
    -[SIRINLUEXTERNALSpanProperty setKey:](self, "setKey:");
    v4 = v11;
  }
  valueString = self->_valueString;
  uint64_t v6 = v4[4];
  if (valueString)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[SIRICOMMONStringValue mergeFrom:](valueString, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[SIRINLUEXTERNALSpanProperty setValueString:](self, "setValueString:");
  }
  v4 = v11;
LABEL_9:
  valueInt = self->_valueInt;
  uint64_t v8 = v4[3];
  if (valueInt)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[SIRICOMMONInt32Value mergeFrom:](valueInt, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[SIRINLUEXTERNALSpanProperty setValueInt:](self, "setValueInt:");
  }
  v4 = v11;
LABEL_15:
  valueFloat = self->_valueFloat;
  uint64_t v10 = v4[2];
  if (valueFloat)
  {
    if (v10) {
      -[SIRICOMMONFloatValue mergeFrom:](valueFloat, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[SIRINLUEXTERNALSpanProperty setValueFloat:](self, "setValueFloat:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  unint64_t v4 = [(SIRICOMMONStringValue *)self->_valueString hash] ^ v3;
  unint64_t v5 = [(SIRICOMMONInt32Value *)self->_valueInt hash];
  return v4 ^ v5 ^ [(SIRICOMMONFloatValue *)self->_valueFloat hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((key = self->_key, !((unint64_t)key | v4[1])) || -[NSString isEqual:](key, "isEqual:"))
    && ((valueString = self->_valueString, !((unint64_t)valueString | v4[4]))
     || -[SIRICOMMONStringValue isEqual:](valueString, "isEqual:"))
    && ((valueInt = self->_valueInt, !((unint64_t)valueInt | v4[3]))
     || -[SIRICOMMONInt32Value isEqual:](valueInt, "isEqual:")))
  {
    valueFloat = self->_valueFloat;
    if ((unint64_t)valueFloat | v4[2]) {
      char v9 = -[SIRICOMMONFloatValue isEqual:](valueFloat, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_key copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(SIRICOMMONStringValue *)self->_valueString copyWithZone:a3];
  char v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(SIRICOMMONInt32Value *)self->_valueInt copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(SIRICOMMONFloatValue *)self->_valueFloat copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    objc_msgSend(v4, "setKey:");
    id v4 = v5;
  }
  if (self->_valueString)
  {
    objc_msgSend(v5, "setValueString:");
    id v4 = v5;
  }
  if (self->_valueInt)
  {
    objc_msgSend(v5, "setValueInt:");
    id v4 = v5;
  }
  if (self->_valueFloat)
  {
    objc_msgSend(v5, "setValueFloat:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_valueString)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_valueInt)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_valueFloat)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALSpanPropertyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  valueString = self->_valueString;
  if (valueString)
  {
    v7 = [(SIRICOMMONStringValue *)valueString dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"value_string"];
  }
  valueInt = self->_valueInt;
  if (valueInt)
  {
    char v9 = [(SIRICOMMONInt32Value *)valueInt dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"value_int"];
  }
  valueFloat = self->_valueFloat;
  if (valueFloat)
  {
    v11 = [(SIRICOMMONFloatValue *)valueFloat dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"value_float"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALSpanProperty;
  id v4 = [(SIRINLUEXTERNALSpanProperty *)&v8 description];
  id v5 = [(SIRINLUEXTERNALSpanProperty *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasValueFloat
{
  return self->_valueFloat != 0;
}

- (BOOL)hasValueInt
{
  return self->_valueInt != 0;
}

- (BOOL)hasValueString
{
  return self->_valueString != 0;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

@end