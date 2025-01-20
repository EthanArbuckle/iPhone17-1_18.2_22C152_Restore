@interface SIRINLUEXTERNALNLU_ROUTERTypedValue
- (BOOL)hasPrimitive;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SIRINLUEXTERNALNLU_ROUTERPrimitiveValue)primitive;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPrimitive:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALNLU_ROUTERTypedValue

- (void).cxx_destruct
{
}

- (void)setPrimitive:(id)a3
{
}

- (SIRINLUEXTERNALNLU_ROUTERPrimitiveValue)primitive
{
  return self->_primitive;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  primitive = self->_primitive;
  uint64_t v6 = v4[1];
  if (primitive)
  {
    if (v6) {
      -[SIRINLUEXTERNALNLU_ROUTERPrimitiveValue mergeFrom:](primitive, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALNLU_ROUTERTypedValue setPrimitive:](self, "setPrimitive:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  return [(SIRINLUEXTERNALNLU_ROUTERPrimitiveValue *)self->_primitive hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    primitive = self->_primitive;
    if ((unint64_t)primitive | v4[1]) {
      char v6 = -[SIRINLUEXTERNALNLU_ROUTERPrimitiveValue isEqual:](primitive, "isEqual:");
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
  id v6 = [(SIRINLUEXTERNALNLU_ROUTERPrimitiveValue *)self->_primitive copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  primitive = self->_primitive;
  if (primitive) {
    [a3 setPrimitive:primitive];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_primitive) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALNLU_ROUTERTypedValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  primitive = self->_primitive;
  if (primitive)
  {
    v5 = [(SIRINLUEXTERNALNLU_ROUTERPrimitiveValue *)primitive dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"primitive"];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALNLU_ROUTERTypedValue;
  v4 = [(SIRINLUEXTERNALNLU_ROUTERTypedValue *)&v8 description];
  v5 = [(SIRINLUEXTERNALNLU_ROUTERTypedValue *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasPrimitive
{
  return self->_primitive != 0;
}

@end