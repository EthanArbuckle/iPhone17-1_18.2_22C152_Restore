@interface PTTensorSwapPair
- (PTTensorSwapPair)initWithIOSurfaces:(__IOSurface *)a3 names:(id)a4;
- (__CVBuffer)tensorWithIndex:(int)a3;
- (id)tensorNameWithIndex:(int)a3;
- (void)dealloc;
@end

@implementation PTTensorSwapPair

- (PTTensorSwapPair)initWithIOSurfaces:(__IOSurface *)a3 names:(id)a4
{
  *(void *)&v21[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PTTensorSwapPair;
  v7 = [(PTTensorSwapPair *)&v19 init];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = 0;
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    names = v7->_names;
    char v12 = 1;
    do
    {
      char v13 = v12;
      if (CVPixelBufferCreateWithIOSurface(v10, a3[v9], 0, &v8->_tensorPair[v9]))
      {
        v14 = _PTLogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[PTTensorSwapPair initWithIOSurfaces:names:](buf, v21, v14);
        }
      }
      uint64_t v15 = [v6 objectAtIndexedSubscript:v9];
      v16 = names[v9];
      names[v9] = (NSString *)v15;

      char v12 = 0;
      uint64_t v9 = 1;
    }
    while ((v13 & 1) != 0);
    v17 = v8;
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v3 = 0;
  tensorPair = self->_tensorPair;
  char v5 = 1;
  do
  {
    char v6 = v5;
    v7 = tensorPair[v3];
    if (v7) {
      CVPixelBufferRelease(v7);
    }
    char v5 = 0;
    uint64_t v3 = 1;
  }
  while ((v6 & 1) != 0);
  v8.receiver = self;
  v8.super_class = (Class)PTTensorSwapPair;
  [(PTTensorSwapPair *)&v8 dealloc];
}

- (__CVBuffer)tensorWithIndex:(int)a3
{
  int v3 = a3 & 1;
  if (a3 < 0) {
    int v3 = -v3;
  }
  return self->_tensorPair[v3];
}

- (id)tensorNameWithIndex:(int)a3
{
  int v3 = a3 & 1;
  if (a3 < 0) {
    int v3 = -v3;
  }
  return self->_names[v3];
}

- (void).cxx_destruct
{
  uint64_t v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (void)initWithIOSurfaces:(os_log_t)log names:.cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "status == noErr";
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", buf, 0xCu);
}

@end