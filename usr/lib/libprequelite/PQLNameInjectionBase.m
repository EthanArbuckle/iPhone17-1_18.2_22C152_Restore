@interface PQLNameInjectionBase
- (PQLNameInjectionBase)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (PQLNameInjectionBase)initWithData:(id)a3;
- (const)bytes;
- (unint64_t)length;
- (void)dealloc;
@end

@implementation PQLNameInjectionBase

- (unint64_t)length
{
  return self->_length;
}

- (PQLNameInjectionBase)initWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  return [(PQLNameInjectionBase *)self initWithBytes:v5 length:v6];
}

- (PQLNameInjectionBase)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PQLNameInjectionBase;
  uint64_t v6 = [(PQLNameInjectionBase *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_length = a4;
    v8 = (char *)malloc_type_malloc(a4 + 1, 0x84D87354uLL);
    v7->_bytes = v8;
    if (!v8) {
      abort();
    }
    memcpy(v8, a3, a4);
    v7->_bytes[a4] = 0;
  }
  return v7;
}

- (const)bytes
{
  return self->_bytes;
}

- (void)dealloc
{
  free(self->_bytes);
  v3.receiver = self;
  v3.super_class = (Class)PQLNameInjectionBase;
  [(PQLNameInjectionBase *)&v3 dealloc];
}

@end