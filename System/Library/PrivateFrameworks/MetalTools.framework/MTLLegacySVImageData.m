@interface MTLLegacySVImageData
- (MTLDebugInstrumentationData)debugInstrumentationData;
- (MTLLegacySVDynamicLibrary)dynamicLibrary;
- (MTLLegacySVFunction)function;
- (MTLLegacySVImageData)initWithDynamicLibrary:(id)a3;
- (MTLLegacySVImageData)initWithFunction:(id)a3;
- (MTLLegacySVImageData)initWithFunction:(id)a3 debugInstrumentationData:(id)a4;
- (NSString)loadedImageName;
- (id).cxx_construct;
- (int)imageType;
- (unint64_t)functionType;
- (void)_applyConstantRelocation;
- (void)_applyConstantRelocation:(id)a3;
- (void)_applyImageIDRelocation:(id)a3;
- (void)dealloc;
- (void)setConstantData:(id)a3;
@end

@implementation MTLLegacySVImageData

- (MTLLegacySVImageData)initWithDynamicLibrary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVImageData;
  id v4 = [(MTLLegacySVImageData *)&v6 init];
  *((void *)v4 + 21) = v4;
  *((void *)v4 + 2) = [a3 device];
  objc_storeWeak((id *)v4 + 24, a3);
  *((void *)v4 + 18) = objc_msgSend((id)objc_msgSend(a3, "installName"), "copy");
  *((void *)v4 + 19) = (id)[a3 debugInstrumentationData];
  *((_DWORD *)v4 + 40) = 1;
  [v4 _applyImageIDRelocation:objc_loadWeak((id *)v4 + 24)];
  return (MTLLegacySVImageData *)v4;
}

- (MTLLegacySVImageData)initWithFunction:(id)a3
{
  uint64_t v5 = [a3 debugInstrumentationData];

  return [(MTLLegacySVImageData *)self initWithFunction:a3 debugInstrumentationData:v5];
}

- (MTLLegacySVImageData)initWithFunction:(id)a3 debugInstrumentationData:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTLLegacySVImageData;
  id v6 = [(MTLLegacySVImageData *)&v8 init];
  *((void *)v6 + 21) = v6;
  *((void *)v6 + 2) = [a3 device];
  objc_storeWeak((id *)v6 + 23, a3);
  *((void *)v6 + 18) = objc_msgSend((id)objc_msgSend(a3, "name"), "copy");
  *((void *)v6 + 22) = [a3 functionType];
  *((void *)v6 + 19) = a4;
  *((_DWORD *)v6 + 40) = 0;
  [v6 _applyImageIDRelocation:objc_loadWeak((id *)v6 + 23)];
  return (MTLLegacySVImageData *)v6;
}

- (void)_applyConstantRelocation
{
  int v3 = *((_DWORD *)self + 40);
  if (v3 == 1)
  {
    uint64_t v4 = 192;
  }
  else
  {
    if (v3) {
      return;
    }
    uint64_t v4 = 184;
  }
  id Weak = objc_loadWeak((id *)((char *)self + v4));

  [(MTLLegacySVImageData *)self _applyConstantRelocation:Weak];
}

- (void)_applyConstantRelocation:(id)a3
{
  if ([*((id *)self + 2) supportsGlobalVariableRelocationCompute]
    && (*((_DWORD *)self + 40) || (unint64_t)(*((void *)self + 22) - 4) <= 2))
  {
    uint64_t v7 = MTLLegacySVBufferHandleToOffset(*((void *)self + 11));
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F12868]) initWithSymbolName:@"mtl.global_constants_handle" bytes:&v7 length:8];
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "relocations"), "count") + 2);
    if ([a3 relocations]) {
      objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(a3, "relocations"));
    }
    [v6 addObject:v5];
    [a3 setRelocations:v6];
  }
}

- (void)_applyImageIDRelocation:(id)a3
{
  if ([*((id *)self + 2) supportsGlobalVariableRelocationCompute]
    && (*((_DWORD *)self + 40) || (unint64_t)(*((void *)self + 22) - 4) <= 2))
  {
    id v6 = (id)[objc_alloc(MEMORY[0x263F12868]) initWithSymbolName:@"mtl.current_image_id" bytes:(char *)self + 168 length:8];
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "relocations"), "count") + 2);
    if ([a3 relocations]) {
      objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(a3, "relocations"));
    }
    [v5 addObject:v6];
    [a3 setRelocations:v5];
  }
}

- (void)setConstantData:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::mutex *)((char *)self + 24);
  std::mutex::lock((std::mutex *)((char *)self + 24));
  if (a3 && [a3 length])
  {
    if (!*((void *)self + 1))
    {
      LegacySVConstantBufferCache::getOrCreateBuffer((LegacySVConstantBufferCache *)(*((void *)self + 2) + 432), (NSData *)a3, (uint64_t)v8);
      long long v6 = v8[1];
      *((_OWORD *)self + 6) = v8[0];
      *((_OWORD *)self + 7) = v6;
      uint64_t v7 = v10;
      *((void *)self + 16) = v9;
      *((void *)self + 17) = v7;
      *((void *)self + 1) = v7;
      if (*((void *)self + 11)) {
        objc_msgSend(v7, "setBufferIndex:");
      }
      else {
        *((void *)self + 11) = [v7 bufferIndex];
      }
      [(MTLLegacySVImageData *)self _applyConstantRelocation];
    }
  }
  else
  {
    [(MTLLegacySVImageData *)self _applyConstantRelocation];
  }
  std::mutex::unlock(v5);
}

- (NSString)loadedImageName
{
  return (NSString *)*((void *)self + 18);
}

- (MTLLegacySVDynamicLibrary)dynamicLibrary
{
  return (MTLLegacySVDynamicLibrary *)objc_loadWeak((id *)self + 24);
}

- (MTLLegacySVFunction)function
{
  return (MTLLegacySVFunction *)objc_loadWeak((id *)self + 23);
}

- (unint64_t)functionType
{
  return *((void *)self + 22);
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  return (MTLDebugInstrumentationData *)*((void *)self + 19);
}

- (int)imageType
{
  return *((_DWORD *)self + 40);
}

- (void)dealloc
{
  if (*((void *)self + 17)) {
    LegacySVConstantBufferCache::releaseBuffer((LegacySVConstantBufferCache *)(*((void *)self + 2) + 432), (KeyBufferPair *)self + 2);
  }

  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVImageData;
  [(MTLLegacySVImageData *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)self + 24);
  objc_destroyWeak((id *)self + 23);

  std::mutex::~mutex((std::mutex *)((char *)self + 24));
}

- (id).cxx_construct
{
  *((void *)self + 3) = 850045863;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((void *)self + 10) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 17) = 0;
  return self;
}

@end