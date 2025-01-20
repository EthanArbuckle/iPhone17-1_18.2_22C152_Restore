@interface TXRDefaultBuffer
- (TXRDefaultBuffer)initWithBytes:(void *)a3 length:(unint64_t)a4;
- (TXRDefaultBuffer)initWithData:(id)a3 zone:(_NSZone *)a4;
- (TXRDefaultBuffer)initWithLength:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)map;
- (void)dealloc;
@end

@implementation TXRDefaultBuffer

- (TXRDefaultBuffer)initWithData:(id)a3 zone:(_NSZone *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TXRDefaultBuffer;
  v7 = [(TXRDefaultBuffer *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copyWithZone:a4];
    data = v7->_data;
    v7->_data = (NSMutableData *)v8;
  }
  return v7;
}

- (TXRDefaultBuffer)initWithBytes:(void *)a3 length:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TXRDefaultBuffer;
  id v6 = [(TXRDefaultBuffer *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:a3 length:a4];
    data = v6->_data;
    v6->_data = (NSMutableData *)v7;
  }
  return v6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TXRDefaultBuffer;
  [(TXRDefaultBuffer *)&v2 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [TXRDefaultBuffer alloc];
  data = self->_data;
  return [(TXRDefaultBuffer *)v5 initWithData:data zone:a3];
}

- (TXRDefaultBuffer)initWithLength:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TXRDefaultBuffer;
  v4 = [(TXRDefaultBuffer *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:a3];
    data = v4->_data;
    v4->_data = (NSMutableData *)v5;
  }
  return v4;
}

- (id)map
{
  id v2 = [[TXRDefaultBufferMap alloc] initForBuffer:self withBytes:[(NSMutableData *)self->_data mutableBytes]];
  return v2;
}

- (void).cxx_destruct
{
}

@end