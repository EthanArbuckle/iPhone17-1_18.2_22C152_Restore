@interface RMSDAAPEncoder
- (NSData)data;
- (RMSDAAPEncoder)init;
- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forCode:(unsigned int)a5;
- (void)encodeData:(id)a3 forCode:(unsigned int)a4;
- (void)encodeInt32:(int)a3 forCode:(unsigned int)a4;
- (void)encodeInt64:(int64_t)a3 forCode:(unsigned int)a4;
- (void)encodeString:(id)a3 forCode:(unsigned int)a4;
@end

@implementation RMSDAAPEncoder

- (RMSDAAPEncoder)init
{
  v7.receiver = self;
  v7.super_class = (Class)RMSDAAPEncoder;
  v2 = [(RMSDAAPEncoder *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    data = v2->_data;
    v2->_data = v3;

    v5 = v2;
  }

  return v2;
}

- (void)encodeInt32:(int)a3 forCode:(unsigned int)a4
{
  unsigned int v4 = bswap32(a3);
  [(RMSDAAPEncoder *)self encodeBytes:&v4 length:4 forCode:*(void *)&a4];
}

- (void)encodeInt64:(int64_t)a3 forCode:(unsigned int)a4
{
  unint64_t v4 = bswap64(a3);
  [(RMSDAAPEncoder *)self encodeBytes:&v4 length:8 forCode:*(void *)&a4];
}

- (void)encodeString:(id)a3 forCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v6)
  {
    id v8 = v6;
    unint64_t v7 = [v6 lengthOfBytesUsingEncoding:4];
    id v6 = v8;
    if (!HIDWORD(v7))
    {
      -[RMSDAAPEncoder encodeBytes:length:forCode:](self, "encodeBytes:length:forCode:", [v8 UTF8String], v7, v4);
      id v6 = v8;
    }
  }
}

- (void)encodeData:(id)a3 forCode:(unsigned int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    id v6 = a3;
    uint64_t v7 = [v6 bytes];
    uint64_t v8 = [v6 length];

    [(RMSDAAPEncoder *)self encodeBytes:v7 length:v8 forCode:v4];
  }
}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forCode:(unsigned int)a5
{
  if (a4 - 0x100000000 >= 0xFFFFFFFF00000001)
  {
    uint64_t v12 = v5;
    uint64_t v13 = v6;
    unsigned int v11 = bswap32(a5);
    [(NSMutableData *)self->_data appendBytes:&v11 length:4];
    unsigned int v10 = bswap32(a4);
    [(NSMutableData *)self->_data appendBytes:&v10 length:4];
    [(NSMutableData *)self->_data appendBytes:a3 length:a4];
  }
}

- (NSData)data
{
  return &self->_data->super;
}

- (void).cxx_destruct
{
}

@end