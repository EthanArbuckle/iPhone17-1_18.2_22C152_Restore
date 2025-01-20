@interface STRPSampleByteEncodable
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MyCoolStruct)aStruct;
- (STRPSampleByteEncodable)initWithCoder:(id)a3;
- (STRPSampleByteEncodable)initWithStruct:(MyCoolStruct *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STRPSampleByteEncodable

- (STRPSampleByteEncodable)initWithStruct:(MyCoolStruct *)a3
{
  uint64_t v4 = v3;
  v7.receiver = self;
  v7.super_class = (Class)STRPSampleByteEncodable;
  result = [(STRPSampleByteEncodable *)&v7 init];
  if (result)
  {
    *(void *)&result->_aStruct.aBool = a3;
    *(_DWORD *)&result->_aStruct.someOptions = v4;
    *((_WORD *)&result->_aStruct.someOptions + 2) = WORD2(v4);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (STRPSampleByteEncodable *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int v6 = (int)[(STRPSampleByteEncodable *)self aStruct];
      if ((([(STRPSampleByteEncodable *)v5 aStruct] ^ v6) & 1) != 0
        || (*(void *)&long long v16 = [(STRPSampleByteEncodable *)self aStruct],
            DWORD2(v16) = v7,
            WORD6(v16) = v8,
            *(void *)&long long v15 = [(STRPSampleByteEncodable *)v5 aStruct],
            DWORD2(v15) = v9,
            WORD6(v15) = v10,
            *(void *)((char *)&v16 + 6) != *(void *)((char *)&v15 + 6))
        || (unint64_t v11 = [(STRPSampleByteEncodable *)self aStruct],
            (((unint64_t)[(STRPSampleByteEncodable *)v5 aStruct] ^ v11) & 0xFF0000000000) != 0))
      {
        BOOL v12 = 0;
      }
      else
      {
        unint64_t v14 = (unint64_t)[(STRPSampleByteEncodable *)self aStruct] >> 8;
        BOOL v12 = v14 == ((unint64_t)[(STRPSampleByteEncodable *)v5 aStruct] >> 8);
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (STRPSampleByteEncodable)initWithCoder:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v4 = [a3 decodeBytesForKey:@"aStruct" returnedLength:&v7];
  if (v7 == 14)
  {
    self = -[STRPSampleByteEncodable initWithStruct:](self, "initWithStruct:", *(void *)v4, *(unsigned int *)(v4 + 8) | ((unint64_t)*(unsigned __int16 *)(v4 + 12) << 32));
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (MyCoolStruct)aStruct
{
  return *(MyCoolStruct **)&self->_aStruct.aBool;
}

@end