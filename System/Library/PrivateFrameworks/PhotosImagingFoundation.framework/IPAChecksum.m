@interface IPAChecksum
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBytes:(IPAChecksumBytes)a3;
- (IPAChecksum)initWithBytes:(IPAChecksumBytes)a3;
- (IPAChecksum)initWithChecksumAsData:(id)a3;
- (IPAChecksum)initWithData:(id)a3;
- (IPAChecksum)initWithString:(id)a3;
- (IPAChecksumBytes)checksumBytes;
- (id)description;
- (id)string;
- (unint64_t)hash;
@end

@implementation IPAChecksum

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(IPAChecksum *)self string];
  v6 = [v3 stringWithFormat:@"<%@:%p> %@", v4, self, v5];

  return v6;
}

- (unint64_t)hash
{
  return *(void *)&self->_bytes.data[8] ^ *(void *)self->_bytes.data;
}

- (BOOL)isEqualToBytes:(IPAChecksumBytes)a3
{
  return *(void *)self->_bytes.data == *(void *)a3.data
      && *(void *)&self->_bytes.data[8] == *(void *)&a3.data[8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 checksumBytes];
    BOOL v7 = -[IPAChecksum isEqualToBytes:](self, "isEqualToBytes:", v5, v6);

    return v7;
  }
  else
  {
    v9 = (IPAChecksum *)_PFAssertFailHandler();
    return [(IPAChecksum *)v9 string];
  }
}

- (id)string
{
  uint64_t v2 = 0;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  p_bytes = &self->_bytes;
  do
  {
    unsigned int v4 = p_bytes->data[0];
    p_bytes = (IPAChecksumBytes *)((char *)p_bytes + 1);
    char v5 = byte_1DD4240E0[v4 & 0xF];
    uint64_t v6 = &v9[v2];
    unsigned char *v6 = byte_1DD4240E0[(unint64_t)v4 >> 4];
    v6[1] = v5;
    v2 += 2;
  }
  while (v2 != 32);
  v9[32] = 0;
  BOOL v7 = [NSString stringWithCString:v9 encoding:1];
  return v7;
}

- (IPAChecksumBytes)checksumBytes
{
  uint64_t v2 = *(void *)&self->_bytes.data[8];
  uint64_t v3 = *(void *)self->_bytes.data;
  *(void *)&result.data[8] = v2;
  *(void *)result.data = v3;
  return result;
}

- (IPAChecksum)initWithChecksumAsData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    char v5 = v4;
    if ([v4 length] == 16)
    {
      id v6 = v5;
      BOOL v7 = (void *)[v6 bytes];
      v8 = -[IPAChecksum initWithBytes:](self, "initWithBytes:", *v7, v7[1]);

      return v8;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  uint64_t v10 = (IPAChecksum *)_PFAssertFailHandler();
  return [(IPAChecksum *)v10 initWithData:v12];
}

- (IPAChecksum)initWithData:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v11.receiver = self;
    v11.super_class = (Class)IPAChecksum;
    char v5 = [(IPAChecksum *)&v11 init];
    id v6 = v4;
    CC_MD5((const void *)[v6 bytes], objc_msgSend(v6, "length"), v5->_bytes.data);

    return v5;
  }
  else
  {
    v8 = (IPAChecksum *)_PFAssertFailHandler();
    return [(IPAChecksum *)v8 initWithString:v10];
  }
}

- (IPAChecksum)initWithString:(id)a3
{
  id v4 = a3;
  if (![v4 length])
  {
    _PFAssertFailHandler();
    goto LABEL_14;
  }
  v19.receiver = self;
  v19.super_class = (Class)IPAChecksum;
  char v5 = [(IPAChecksum *)&v19 init];
  if ([v4 length] != 32)
  {
LABEL_14:
    v17 = (IPAChecksum *)_PFAssertFailHandler();
    return [(IPAChecksum *)v17 initWithBytes:v20];
  }
  id v6 = [v4 uppercaseString];
  uint64_t v7 = [v6 UTF8String];

  unint64_t v8 = 0;
  uint64_t v9 = 8;
  do
  {
    int v10 = *(char *)(v7 + v8);
    if (v10 <= 64) {
      char v11 = 64;
    }
    else {
      char v11 = 9;
    }
    char v12 = v11 + v10;
    int v13 = *(char *)(v7 + v8 + 1);
    if (v13 <= 64) {
      char v14 = -48;
    }
    else {
      char v14 = -55;
    }
    *((unsigned char *)&v5->super.isa + v9++) = v14 + v13 + 16 * v12;
    BOOL v15 = v8 >= 0x1E;
    v8 += 2;
  }
  while (!v15);

  return v5;
}

- (IPAChecksum)initWithBytes:(IPAChecksumBytes)a3
{
  uint64_t v3 = *(void *)&a3.data[8];
  uint64_t v4 = *(void *)a3.data;
  v6.receiver = self;
  v6.super_class = (Class)IPAChecksum;
  IPAChecksumBytes result = [(IPAChecksum *)&v6 init];
  *(void *)result->_bytes.data = v4;
  *(void *)&result->_bytes.data[8] = v3;
  return result;
}

@end