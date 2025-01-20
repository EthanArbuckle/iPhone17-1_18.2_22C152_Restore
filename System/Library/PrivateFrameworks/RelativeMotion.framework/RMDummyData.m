@interface RMDummyData
+ (BOOL)supportsSecureCoding;
- ($AE72BB7FA4D4C7C6B4FE5A9414CF8B1A)payload;
- (RMDummyData)initWithCoder:(id)a3;
- (RMDummyData)initWithPayload:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RMDummyData

- (RMDummyData)initWithPayload:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RMDummyData;
  result = [(RMDummyData *)&v8 init];
  if (result)
  {
    long long v5 = *(_OWORD *)a3->var0.var0;
    long long v6 = *((_OWORD *)&a3->var0.var1 + 1);
    long long v7 = *((_OWORD *)&a3->var0.var1 + 2);
    *((_OWORD *)&result->_payload.var0.abstime + 3) = *((_OWORD *)&a3->var0.var1 + 3);
    *((_OWORD *)&result->_payload.var0.abstime + 2) = v7;
    *((_OWORD *)&result->_payload.var0.abstime + 1) = v6;
    *(_OWORD *)result->_payload.var0.data = v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (RMDummyData)initWithCoder:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  v4 = (long long *)[a3 decodeBytesForKey:@"DummyDataEncodingKey" returnedLength:&v10];
  long long v5 = 0;
  if (v4 && v10 == 64)
  {
    long long v6 = *v4;
    long long v7 = v4[1];
    long long v8 = v4[3];
    v11[2] = v4[2];
    v11[3] = v8;
    v11[0] = v6;
    v11[1] = v7;
    self = [(RMDummyData *)self initWithPayload:v11];
    long long v5 = self;
  }

  return v5;
}

- ($AE72BB7FA4D4C7C6B4FE5A9414CF8B1A)payload
{
  long long v3 = *(_OWORD *)(&self->var0.var1 + 3);
  *(_OWORD *)retstr->var0.var0 = *(_OWORD *)(&self->var0.var1 + 1);
  *((_OWORD *)&retstr->var0.var1 + 1) = v3;
  long long v4 = *(_OWORD *)(&self->var0.var1 + 7);
  *((_OWORD *)&retstr->var0.var1 + 2) = *(_OWORD *)(&self->var0.var1 + 5);
  *((_OWORD *)&retstr->var0.var1 + 3) = v4;
  return self;
}

@end