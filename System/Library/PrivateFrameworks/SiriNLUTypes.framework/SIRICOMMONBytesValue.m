@interface SIRICOMMONBytesValue
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRICOMMONBytesValue

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3
{
}

- (NSData)value
{
  return self->_value;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[SIRICOMMONBytesValue setValue:](self, "setValue:");
  }
}

- (unint64_t)hash
{
  return [(NSData *)self->_value hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    value = self->_value;
    if ((unint64_t)value | v4[1]) {
      char v6 = -[NSData isEqual:](value, "isEqual:");
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
  uint64_t v6 = [(NSData *)self->_value copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)copyTo:(id)a3
{
  value = self->_value;
  if (value) {
    [a3 setValue:value];
  }
}

- (void)writeTo:(id)a3
{
  if (self->_value) {
    PBDataWriterWriteDataField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRICOMMONBytesValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }
  return v4;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRICOMMONBytesValue;
  v4 = [(SIRICOMMONBytesValue *)&v8 description];
  v5 = [(SIRICOMMONBytesValue *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

@end