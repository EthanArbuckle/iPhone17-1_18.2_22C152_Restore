@interface PBMessageStreamWriter
- (BOOL)writeMessage:(id)a3;
- (PBMessageStreamWriter)initWithOutputStream:(id)a3;
@end

@implementation PBMessageStreamWriter

- (void).cxx_destruct
{
}

- (BOOL)writeMessage:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = [a3 data];
  unint64_t v5 = [v4 length];
  v6 = v14;
  if (v5 < 0x80)
  {
    LOBYTE(v7) = v5;
  }
  else
  {
    do
    {
      *v6++ = v5 | 0x80;
      unint64_t v7 = v5 >> 7;
      unint64_t v8 = v5 >> 14;
      v5 >>= 7;
    }
    while (v8);
  }
  unsigned char *v6 = v7;
  if ([(NSOutputStream *)self->_stream write:v14 maxLength:v6 - v14 + 1] == v6 - v14 + 1)
  {
    if ([v4 length])
    {
      stream = self->_stream;
      id v10 = v4;
      uint64_t v11 = -[NSOutputStream write:maxLength:](stream, "write:maxLength:", [v10 bytes], objc_msgSend(v10, "length"));
      BOOL v12 = v11 == [v10 length];
    }
    else
    {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (PBMessageStreamWriter)initWithOutputStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBMessageStreamWriter;
  v6 = [(PBMessageStreamWriter *)&v9 init];
  unint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stream, a3);
  }

  return v7;
}

@end