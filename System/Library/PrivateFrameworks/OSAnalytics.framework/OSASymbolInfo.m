@interface OSASymbolInfo
- (BOOL)isAppleCode;
- (NSString)cpuArch;
- (NSString)name;
- (NSString)path;
- (OSASymbolInfo)initWithAddress:(unint64_t)a3 size:(unint64_t)a4 for:(unsigned __int8)a5[16];
- (OSASymbolInfo)initWithSharedCache:(unsigned __int8)a3[16] atBaseAddress:(unint64_t)a4;
- (id)get_uuid;
- (unint64_t)size;
- (unint64_t)start;
- (void)setCpuArch:(id)a3;
- (void)setIsAppleCode:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPath:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)setStart:(unint64_t)a3;
@end

@implementation OSASymbolInfo

- (OSASymbolInfo)initWithAddress:(unint64_t)a3 size:(unint64_t)a4 for:(unsigned __int8)a5[16]
{
  v9.receiver = self;
  v9.super_class = (Class)OSASymbolInfo;
  result = [(OSASymbolInfo *)&v9 init];
  if (result)
  {
    if (a5) {
      *(_OWORD *)result->_uuid = *(_OWORD *)a5;
    }
    result->_start = a3;
    result->_size = a4;
  }
  return result;
}

- (OSASymbolInfo)initWithSharedCache:(unsigned __int8)a3[16] atBaseAddress:(unint64_t)a4
{
  v20.receiver = self;
  v20.super_class = (Class)OSASymbolInfo;
  v6 = [(OSASymbolInfo *)&v20 init];
  v7 = (OSASymbolInfo *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = *(_OWORD *)a3;
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2020000000;
    uint64_t v19 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    int v15 = 0;
    *((void *)v6 + 5) = a4;
    v8 = v6;
    dyld_shared_cache_iterate_text();
    unint64_t v9 = v17[3];
    unint64_t start = v7->_start;
    BOOL v11 = v9 > start;
    uint64_t v12 = v9 - start;
    if (!v11) {
      uint64_t v12 = 0x40000000;
    }
    *((void *)v8 + 6) = v12;

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(&v16, 8);
  }
  return v7;
}

void *__51__OSASymbolInfo_initWithSharedCache_atBaseAddress___block_invoke(void *result, uint64_t a2)
{
  uint64_t v2 = result[4];
  unint64_t v3 = *(void *)(a2 + 8);
  if (*(void *)(v2 + 40) - 1 >= v3)
  {
    *(void *)(v2 + 40) = v3;
    unint64_t v3 = *(void *)(a2 + 8);
  }
  unint64_t v4 = *(void *)(a2 + 16) + v3;
  uint64_t v5 = *(void *)(result[5] + 8);
  if (v4 > *(void *)(v5 + 24)) {
    *(void *)(v5 + 24) = v4;
  }
  ++*(_DWORD *)(*(void *)(result[6] + 8) + 24);
  return result;
}

- (id)get_uuid
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  uuid_unparse_lower(self->_uuid, v4);
  uint64_t v2 = [NSString stringWithUTF8String:v4];
  return v2;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
  id v5 = a3;
  BOOL v6 = +[OSABinaryImageCatalog isApplePath:v5 orBundle:0];

  self->_isAppleCode = v6;
}

- (unint64_t)start
{
  return self->_start;
}

- (void)setStart:(unint64_t)a3
{
  self->_unint64_t start = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setName:(id)a3
{
}

- (BOOL)isAppleCode
{
  return self->_isAppleCode;
}

- (void)setIsAppleCode:(BOOL)a3
{
  self->_isAppleCode = a3;
}

- (NSString)cpuArch
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCpuArch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cpuArch, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->legacy_arch, 0);
}

@end