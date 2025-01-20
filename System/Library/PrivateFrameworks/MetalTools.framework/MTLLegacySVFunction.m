@interface MTLLegacySVFunction
+ (id)convertUserType:(id)a3;
+ (id)internalArrayTypeFromUserArrayType:(id)a3;
+ (id)internalStructTypeFromUserStructType:(id)a3;
- (MTLLegacySVFunction)initWithFunction:(id)a3 library:(id)a4;
- (id).cxx_construct;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5 binaryArchives:(id)a6;
- (void)_initImageData;
- (void)dealloc;
- (void)prepareForBinaryFunctionUsage;
@end

@implementation MTLLegacySVFunction

- (MTLLegacySVFunction)initWithFunction:(id)a3 library:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)MTLLegacySVFunction;
  return [(MTLToolsObject *)&v5 initWithBaseObject:a3 parent:a4];
}

- (void)_initImageData
{
  if (!*((void *)self + 6))
  {
    v3 = [[MTLLegacySVImageData alloc] initWithFunction:self];
    uint64_t v4 = 0;
    atomic_compare_exchange_strong((atomic_ullong *volatile)self + 6, (unint64_t *)&v4, (unint64_t)v3);
    if (v4)
    {
    }
  }
}

- (void)prepareForBinaryFunctionUsage
{
  [(MTLLegacySVFunction *)self _initImageData];
  v3 = (void *)*((void *)self + 6);
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*((id *)self + 2), "debugInstrumentationData"), "globalConstantsData");

  [v3 setConstantData:v4];
}

+ (id)convertUserType:(id)a3
{
  uint64_t v4 = [a3 dataType];
  id result = 0;
  if (v4 > 116)
  {
    if ((unint64_t)(v4 - 117) >= 2) {
      return a3;
    }
  }
  else
  {
    switch(v4)
    {
      case 1:
        return +[MTLLegacySVFunction internalStructTypeFromUserStructType:a3];
      case 2:
        return +[MTLLegacySVFunction internalArrayTypeFromUserArrayType:a3];
      case 60:
        break;
      default:
        return a3;
    }
  }
  return result;
}

+ (id)internalArrayTypeFromUserArrayType:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [a3 elementType];
  if (v4 <= 116)
  {
    switch(v4)
    {
      case 1:
        uint64_t v9 = [v3 elementStructType];
        break;
      case 2:
        uint64_t v9 = [v3 elementArrayType];
        break;
      case 60:
        goto LABEL_7;
      default:
        return v3;
    }
    id v8 = (id)v9;
    goto LABEL_12;
  }
  if ((unint64_t)(v4 - 117) < 2)
  {
LABEL_7:
    uint64_t v5 = [v3 stride];
    MTLDataType v6 = [v3 arrayLength];
    id v7 = (id)[objc_alloc(MEMORY[0x263F127C8]) initWithArrayLength:v6 elementType:57 stride:v5 pixelFormat:0 aluType:0 details:getIndirectConstant(v6)];
    if (v7)
    {
LABEL_14:
      objc_msgSend(v7, "setIndirectArgumentIndexStride:", objc_msgSend(v3, "indirectArgumentIndexStride"));
      return v7;
    }
    id v8 = 0;
LABEL_12:
    id v10 = +[MTLLegacySVFunction convertUserType:v8];
    id v7 = v3;
    if (v10 != v8)
    {
      id v11 = v10;
      uint64_t v12 = [v3 elementType];
      uint64_t v13 = [v3 stride];
      uint64_t v14 = [v3 arrayLength];
      id v7 = (id)[objc_alloc(MEMORY[0x263F127C8]) initWithArrayLength:v14 elementType:v12 stride:v13 pixelFormat:0 aluType:0 details:v11];
    }
    goto LABEL_14;
  }
  return v3;
}

+ (id)internalStructTypeFromUserStructType:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263F12A40]);
  uint64_t v5 = (void *)MEMORY[0x23ECD5710]();
  __p = 0;
  v28 = 0;
  uint64_t v29 = 0;
  std::vector<objc_object  {objcproto9MTLBuffer}*>::resize((uint64_t)&__p, objc_msgSend((id)objc_msgSend(a3, "members"), "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  MTLDataType v6 = (void *)[a3 members];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v7)
  {
    v21 = v5;
    id v22 = v4;
    int v8 = 0;
    uint64_t v9 = *(void *)v24;
    while (1)
    {
      uint64_t v10 = 0;
      int v11 = v8;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        id StructMember = *(id *)(*((void *)&v23 + 1) + 8 * v10);
        if (objc_msgSend(StructMember, "dataType", v21, v22) == 60
          || [StructMember dataType] == 118
          || [StructMember dataType] == 117)
        {
          uint64_t v13 = (NSString *)[StructMember name];
          uint64_t v14 = [StructMember offset];
          MTLDataType v15 = [StructMember argumentIndex];
          IndirectConstant = (objc_object *)getIndirectConstant(v15);
          MTLDataType v17 = MTLDataTypeBool4|MTLDataTypeStruct;
LABEL_10:
          id StructMember = getStructMember(v13, v14, v17, v15, IndirectConstant);
          goto LABEL_11;
        }
        if ([StructMember dataType] == 1)
        {
          uint64_t v13 = (NSString *)[StructMember name];
          uint64_t v14 = [StructMember offset];
          MTLDataType v15 = [StructMember argumentIndex];
          IndirectConstant = +[MTLLegacySVFunction convertUserType:](MTLLegacySVFunction, "convertUserType:", [StructMember structType]);
          MTLDataType v17 = MTLDataTypeStruct;
          goto LABEL_10;
        }
        if ([StructMember dataType] == 2)
        {
          uint64_t v13 = (NSString *)[StructMember name];
          uint64_t v14 = [StructMember offset];
          MTLDataType v15 = [StructMember argumentIndex];
          IndirectConstant = +[MTLLegacySVFunction convertUserType:](MTLLegacySVFunction, "convertUserType:", [StructMember arrayType]);
          MTLDataType v17 = MTLDataTypeArray;
          goto LABEL_10;
        }
LABEL_11:
        *((void *)__p + (v11 + v10++)) = StructMember;
      }
      while (v7 != v10);
      uint64_t v18 = [v6 countByEnumeratingWithState:&v23 objects:v30 count:16];
      uint64_t v7 = v18;
      int v8 = v11 + v10;
      if (!v18)
      {
        uint64_t v19 = (v11 + v10);
        uint64_t v5 = v21;
        id v4 = v22;
        goto LABEL_20;
      }
    }
  }
  uint64_t v19 = 0;
LABEL_20:
  [v4 setMembers:__p count:v19];
  if (__p)
  {
    v28 = __p;
    operator delete(__p);
  }
  return v4;
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5 binaryArchives:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  int v11 = (unsigned char *)*((void *)self + 3);
  if ((v11[286] & 0x80) != 0)
  {
    v27 = (void *)[v11 baseObject];
    std::mutex::lock((std::mutex *)((char *)self + 56));
    LODWORD(v28) = a3;
    uint64_t v13 = std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<GPUDebugArgumentEncoderLayout>>>>::find<unsigned int>((void *)self + 15, (unsigned int *)&v28);
    if (v13 && (uint64_t v14 = (void *)v13[3]) != 0)
    {
      if (a5)
      {
        if (!a4) {
          goto LABEL_43;
        }
        MTLDataType v15 = (void *)[*((id *)self + 2) newArgumentEncoderWithBufferIndex:a3 reflection:a4 pipelineLibrary:a5];
      }
      else if (a6)
      {
        if (!a4) {
          goto LABEL_43;
        }
        MTLDataType v15 = (void *)[*((id *)self + 2) newArgumentEncoderWithBufferIndex:a3 reflection:a4 binaryArchives:a6];
      }
      else
      {
        if (!a4) {
          goto LABEL_43;
        }
        MTLDataType v15 = (void *)[*((id *)self + 2) newArgumentEncoderWithBufferIndex:a3 reflection:a4];
      }
    }
    else
    {
      if (a5)
      {
        if (a4) {

        }
        uint64_t v16 = [*((id *)self + 2) reflectionWithOptions:3 pipelineLibrary:a5];
      }
      else if (a6)
      {
        if (a4) {

        }
        uint64_t v16 = [*((id *)self + 2) reflectionWithOptions:3 binaryArchives:a6];
      }
      else
      {
        if (a4) {

        }
        uint64_t v16 = [*((id *)self + 2) reflectionWithOptions:3];
      }
      uint64_t v18 = (void *)v16;
      if (!v16)
      {
        std::mutex::unlock((std::mutex *)((char *)self + 56));
        return 0;
      }
      context = (void *)MEMORY[0x23ECD5710]();
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v19 = (void *)[v18 arguments];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v31 != v21) {
              objc_enumerationMutation(v19);
            }
            long long v23 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            if (![v23 type] && objc_msgSend(v23, "index") == a3)
            {
              [v23 bufferStructType];
              int v29 = a3;
              operator new();
            }
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v37 count:16];
        }
        while (v20);
      }
      uint64_t v14 = 0;
    }
LABEL_43:
    std::mutex::unlock((std::mutex *)((char *)self + 56));
    if (v14)
    {
      long long v24 = (void *)[v27 newArgumentEncoderWithLayout:*v14];
      MTLDataType v17 = [[MTLLegacySVArgumentEncoder alloc] initWithArgumentEncoder:v24 layout:v14 device:[(MTLToolsObject *)self device]];

      return v17;
    }
    return 0;
  }
  if (a5)
  {
    v36.receiver = self;
    v36.super_class = (Class)MTLLegacySVFunction;
    return [(MTLToolsFunction *)&v36 newArgumentEncoderWithBufferIndex:a3 reflection:a4 pipelineLibrary:a5];
  }
  else if (a6)
  {
    v35.receiver = self;
    v35.super_class = (Class)MTLLegacySVFunction;
    return [(MTLToolsFunction *)&v35 newArgumentEncoderWithBufferIndex:a3 reflection:a4 binaryArchives:a6];
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)MTLLegacySVFunction;
    return [(MTLToolsFunction *)&v34 newArgumentEncoderWithBufferIndex:a3 reflection:a4];
  }
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3
{
  return [(MTLLegacySVFunction *)self newArgumentEncoderWithBufferIndex:a3 reflection:0 pipelineLibrary:0 binaryArchives:0];
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4
{
  return [(MTLLegacySVFunction *)self newArgumentEncoderWithBufferIndex:a3 reflection:a4 pipelineLibrary:0 binaryArchives:0];
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4
{
  return [(MTLLegacySVFunction *)self newArgumentEncoderWithBufferIndex:a3 reflection:0 pipelineLibrary:a4 binaryArchives:0];
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5
{
  return [(MTLLegacySVFunction *)self newArgumentEncoderWithBufferIndex:a3 reflection:a4 pipelineLibrary:a5 binaryArchives:0];
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5
{
  return [(MTLLegacySVFunction *)self newArgumentEncoderWithBufferIndex:a3 reflection:a4 pipelineLibrary:0 binaryArchives:a5];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVFunction;
  [(MTLToolsFunction *)&v3 dealloc];
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,std::unique_ptr<LegacySVArgumentEncoderLayout>>>>::~__hash_table((uint64_t)self + 120);

  std::mutex::~mutex((std::mutex *)((char *)self + 56));
}

- (id).cxx_construct
{
  *((void *)self + 7) = 850045863;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((void *)self + 14) = 0;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *((_DWORD *)self + 38) = 1065353216;
  return self;
}

@end