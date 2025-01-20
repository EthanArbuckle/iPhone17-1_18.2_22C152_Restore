@interface PKProtobufNSDecimalNumber
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)mantissa;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)exponent;
- (int)isCompact;
- (int)isNegative;
- (int)length;
- (int)reserved;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExponent:(int)a3;
- (void)setIsCompact:(int)a3;
- (void)setIsNegative:(int)a3;
- (void)setLength:(int)a3;
- (void)setMantissa:(id)a3;
- (void)setReserved:(int)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufNSDecimalNumber

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufNSDecimalNumber;
  v4 = [(PKProtobufNSDecimalNumber *)&v8 description];
  v5 = [(PKProtobufNSDecimalNumber *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  v5 = [NSNumber numberWithInt:self->_exponent];
  [v3 setObject:v5 forKey:@"exponent"];

  v6 = [NSNumber numberWithInt:self->_length];
  [v3 setObject:v6 forKey:@"length"];

  v7 = [NSNumber numberWithInt:self->_isNegative];
  [v3 setObject:v7 forKey:@"isNegative"];

  objc_super v8 = [NSNumber numberWithInt:self->_isCompact];
  [v3 setObject:v8 forKey:@"isCompact"];

  v9 = [NSNumber numberWithInt:self->_reserved];
  [v3 setObject:v9 forKey:@"reserved"];

  mantissa = self->_mantissa;
  if (mantissa) {
    [v3 setObject:mantissa forKey:@"mantissa"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufNSDecimalNumberReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteSint32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 9) = self->_version;
  *((_DWORD *)a3 + 2) = self->_exponent;
  *((_DWORD *)a3 + 5) = self->_length;
  *((_DWORD *)a3 + 4) = self->_isNegative;
  *((_DWORD *)a3 + 3) = self->_isCompact;
  *((_DWORD *)a3 + 8) = self->_reserved;
  [a3 setMantissa:self->_mantissa];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 36) = self->_version;
  *(_DWORD *)(v5 + 8) = self->_exponent;
  *(_DWORD *)(v5 + 20) = self->_length;
  *(_DWORD *)(v5 + 16) = self->_isNegative;
  *(_DWORD *)(v5 + 12) = self->_isCompact;
  *(_DWORD *)(v5 + 32) = self->_reserved;
  uint64_t v6 = [(NSData *)self->_mantissa copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_version == *((_DWORD *)v4 + 9)
    && self->_exponent == *((_DWORD *)v4 + 2)
    && self->_length == *((_DWORD *)v4 + 5)
    && self->_isNegative == *((_DWORD *)v4 + 4)
    && self->_isCompact == *((_DWORD *)v4 + 3)
    && self->_reserved == *((_DWORD *)v4 + 8))
  {
    mantissa = self->_mantissa;
    if ((unint64_t)mantissa | v4[3]) {
      char v6 = -[NSData isEqual:](mantissa, "isEqual:");
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

- (unint64_t)hash
{
  uint64_t v2 = (2654435761 * self->_exponent) ^ (2654435761 * self->_version) ^ (2654435761 * self->_length) ^ (2654435761 * self->_isNegative);
  uint64_t v3 = (2654435761 * self->_isCompact) ^ (2654435761 * self->_reserved);
  return v2 ^ v3 ^ [(NSData *)self->_mantissa hash];
}

- (void)mergeFrom:(id)a3
{
  self->_version = *((_DWORD *)a3 + 9);
  self->_exponent = *((_DWORD *)a3 + 2);
  self->_length = *((_DWORD *)a3 + 5);
  self->_isNegative = *((_DWORD *)a3 + 4);
  self->_isCompact = *((_DWORD *)a3 + 3);
  self->_reserved = *((_DWORD *)a3 + 8);
  if (*((void *)a3 + 3)) {
    -[PKProtobufNSDecimalNumber setMantissa:](self, "setMantissa:");
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (int)exponent
{
  return self->_exponent;
}

- (void)setExponent:(int)a3
{
  self->_exponent = a3;
}

- (int)length
{
  return self->_length;
}

- (void)setLength:(int)a3
{
  self->_length = a3;
}

- (int)isNegative
{
  return self->_isNegative;
}

- (void)setIsNegative:(int)a3
{
  self->_isNegative = a3;
}

- (int)isCompact
{
  return self->_isCompact;
}

- (void)setIsCompact:(int)a3
{
  self->_isCompact = a3;
}

- (int)reserved
{
  return self->_reserved;
}

- (void)setReserved:(int)a3
{
  self->_reserved = a3;
}

- (NSData)mantissa
{
  return self->_mantissa;
}

- (void)setMantissa:(id)a3
{
}

- (void).cxx_destruct
{
}

@end