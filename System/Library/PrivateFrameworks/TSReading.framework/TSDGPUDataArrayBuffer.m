@interface TSDGPUDataArrayBuffer
- ($94F468A8D4C62B317260615823C2B210)metalPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)metalPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)hasUpdatedData;
- (NSString)description;
- (TSDGPUDataArrayBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 bufferCount:(unint64_t)a5;
- (char)dataPointer;
- (float)metalFloatForAttribute:(id)a3 atIndex:(unint64_t)a4;
- (unint64_t)bufferCount;
- (unint64_t)currentBufferIndex;
- (unint64_t)dataBufferEntrySize;
- (unint64_t)p_bufferOffsetOfAttribute:(id)a3 atIndex:(unint64_t)a4 component:(unint64_t)a5;
- (unint64_t)vertexCount;
- (void)addAllIndexesNeedUpdate;
- (void)addIndexNeedsUpdate:(int64_t)a3;
- (void)addIndexRangeNeedsUpdate:(_NSRange)a3;
- (void)dealloc;
- (void)encodeArrayBufferWithEncoder:(id)a3 atIndex:(int64_t)a4;
- (void)p_setupMetalDataBufferIfNecessaryWithDevice:(id)a3;
- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setCurrentBufferIndex:(unint64_t)a3;
- (void)setMetalFloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setMetalPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setMetalPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setMetalPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)swapGPUDataBuffers;
@end

@implementation TSDGPUDataArrayBuffer

- (void)p_setupMetalDataBufferIfNecessaryWithDevice:(id)a3
{
  id v4 = a3;
  if (!self->_dataBufferHasBeenSetup)
  {
    id v16 = v4;
    unint64_t vertexCount = self->_vertexCount;
    unint64_t v6 = [(TSDGPUDataArrayBuffer *)self dataBufferEntrySize] * vertexCount;
    if (v6 > 0xFFF)
    {
      v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[TSDGPUDataArrayBuffer bufferCount](self, "bufferCount"));
      unint64_t v8 = [(TSDGPUDataArrayBuffer *)self bufferCount];
      v9 = v16;
      if (v8)
      {
        for (unint64_t i = 0; i < v12; ++i)
        {
          v11 = (void *)[v9 newBufferWithBytes:self->_gLData length:v6 options:0];
          [v7 addObject:v11];

          unint64_t v12 = [(TSDGPUDataArrayBuffer *)self bufferCount];
          v9 = v16;
        }
      }
      v13 = (NSArray *)[v7 copy];
      metalDataBuffers = self->_metalDataBuffers;
      self->_metalDataBuffers = v13;

      self->_currentBufferIndex = 0;
      self->_usesMetalBuffer = 1;
      self->_dataBufferHasBeenSetup = 1;
      gLData = self->_gLData;
      if (gLData)
      {
        free(gLData);
        self->_gLData = 0;
      }
    }
    else
    {
      self->_bufferCount = 1;
      self->_dataBufferHasBeenSetup = 1;
    }
    id v4 = v16;
  }
}

- (unint64_t)p_bufferOffsetOfAttribute:(id)a3 atIndex:(unint64_t)a4 component:(unint64_t)a5
{
  id v8 = a3;
  unint64_t v9 = [(TSDGPUDataArrayBuffer *)self dataBufferEntrySize];
  unint64_t v10 = [v8 bufferOffset] + v9 * a4;
  if (a5) {
    v10 += TSDGPUDataBufferDataTypeSize([v8 dataType]) * a5;
  }

  return v10;
}

- (TSDGPUDataArrayBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 bufferCount:(unint64_t)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([v8 count])
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_19:
    v28 = [MEMORY[0x263F7C7F0] currentHandler];
    v29 = [NSString stringWithUTF8String:"-[TSDGPUDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]"];
    v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
    [v28 handleFailureInFunction:v29 file:v30 lineNumber:497 description:@"vertexCount==0!"];

    if (a5) {
      goto LABEL_4;
    }
LABEL_20:
    v31 = [MEMORY[0x263F7C7F0] currentHandler];
    v32 = [NSString stringWithUTF8String:"-[TSDGPUDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]"];
    v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
    [v31 handleFailureInFunction:v32 file:v33 lineNumber:498 description:@"bufferCount==0!"];

    goto LABEL_4;
  }
  v25 = [MEMORY[0x263F7C7F0] currentHandler];
  v26 = [NSString stringWithUTF8String:"-[TSDGPUDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]"];
  v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
  [v25 handleFailureInFunction:v26 file:v27 lineNumber:496 description:@"no attributes!"];

  if (!a4) {
    goto LABEL_19;
  }
LABEL_3:
  if (!a5) {
    goto LABEL_20;
  }
LABEL_4:
  uint64_t v9 = [v8 count];
  unint64_t v10 = 0;
  if (a5 && a4 && v9)
  {
    v42.receiver = self;
    v42.super_class = (Class)TSDGPUDataArrayBuffer;
    v11 = [(TSDGPUDataArrayBuffer *)&v42 init];
    if (v11)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:v8];
      vertexAttributes = v11->_vertexAttributes;
      v11->_vertexAttributes = (NSMutableArray *)v12;

      v11->_unint64_t vertexCount = a4;
      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      attributeOffsetsDictionary = v11->_attributeOffsetsDictionary;
      v11->_attributeOffsetsDictionary = v14;

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v16 = v11->_vertexAttributes;
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        id v37 = v8;
        int v19 = 0;
        uint64_t v20 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v39 != v20) {
              objc_enumerationMutation(v16);
            }
            v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            [v22 setDataArrayBuffer:v11];
            int v23 = TSDGPUDataBufferDataTypeSize([v22 dataType]);
            if (!v11->_bufferUsage) {
              v11->_bufferUsage = [v22 bufferUsage];
            }
            [v22 setBufferOffset:v19];
            v19 += (v23 * [v22 componentCount] + 3) & 0xFFFFFFFC;
            [v22 componentCount];
          }
          uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v18);
        unint64_t v24 = v19;
        id v8 = v37;
      }
      else
      {
        unint64_t v24 = 0;
      }

      v11->_dataBufferEntrySize = v24;
      if ([(TSDGPUDataArrayBuffer *)v11 dataBufferEntrySize]) {
        v11->_gLData = (char *)malloc_type_calloc(v11->_vertexCount, [(TSDGPUDataArrayBuffer *)v11 dataBufferEntrySize], 0x693EB9EEuLL);
      }
      v11->_bufferCount = a5;
      v11->_needsUpdateFirstIndex = (int64_t *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
      v34 = (int64_t *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
      v11->_needsUpdateLastIndex = v34;
      needsUpdateFirstIndex = v11->_needsUpdateFirstIndex;
      do
      {
        *needsUpdateFirstIndex++ = -1;
        *v34++ = -1;
        --a5;
      }
      while (a5);
    }
    self = v11;
    unint64_t v10 = self;
  }

  return v10;
}

- (void)dealloc
{
  free(self->_needsUpdateFirstIndex);
  free(self->_needsUpdateLastIndex);
  gLDataBuffers = self->_gLDataBuffers;
  if (gLDataBuffers)
  {
    free(gLDataBuffers);
    self->_gLDataBuffers = 0;
  }
  gLData = self->_gLData;
  if (gLData)
  {
    free(gLData);
    self->_gLData = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDGPUDataArrayBuffer;
  [(TSDGPUDataArrayBuffer *)&v5 dealloc];
}

- (void)addAllIndexesNeedUpdate
{
}

- (void)addIndexRangeNeedsUpdate:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  -[TSDGPUDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:");

  [(TSDGPUDataArrayBuffer *)self addIndexNeedsUpdate:length + location - 1];
}

- (void)addIndexNeedsUpdate:(int64_t)a3
{
  unint64_t currentBufferIndex = self->_currentBufferIndex;
  needsUpdateFirstIndex = self->_needsUpdateFirstIndex;
  needsUpdateLastIndex = self->_needsUpdateLastIndex;
  int64_t v6 = needsUpdateFirstIndex[currentBufferIndex];
  if (v6 >= a3) {
    int64_t v7 = a3;
  }
  else {
    int64_t v7 = needsUpdateFirstIndex[currentBufferIndex];
  }
  if (v6 == -1) {
    int64_t v8 = a3;
  }
  else {
    int64_t v8 = v7;
  }
  needsUpdateFirstIndex[currentBufferIndex] = v8;
  unint64_t v9 = self->_currentBufferIndex;
  int64_t v10 = needsUpdateLastIndex[v9];
  if (v10 <= a3) {
    int64_t v11 = a3;
  }
  else {
    int64_t v11 = needsUpdateLastIndex[v9];
  }
  if (v10 == -1) {
    int64_t v12 = a3;
  }
  else {
    int64_t v12 = v11;
  }
  needsUpdateLastIndex[v9] = v12;
}

- (void)encodeArrayBufferWithEncoder:(id)a3 atIndex:(int64_t)a4
{
  unint64_t v5 = self->_dataBufferEntrySize * self->_vertexCount;
  if (v5 <= 0x1000)
  {
    gLData = self->_gLData;
    id v10 = a3;
    [v10 setVertexBytes:gLData length:v5 atIndex:a4];
  }
  else
  {
    metalDataBuffers = self->_metalDataBuffers;
    unint64_t currentBufferIndex = self->_currentBufferIndex;
    id v8 = a3;
    id v10 = [(NSArray *)metalDataBuffers objectAtIndexedSubscript:currentBufferIndex];
    objc_msgSend(v8, "setVertexBuffer:offset:atIndex:");
  }
}

- (void)setCurrentBufferIndex:(unint64_t)a3
{
  self->_unint64_t currentBufferIndex = a3;
}

- (void)swapGPUDataBuffers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(TSDGPUDataArrayBuffer *)self setCurrentBufferIndex:([(TSDGPUDataArrayBuffer *)self currentBufferIndex] + 1)% [(TSDGPUDataArrayBuffer *)self bufferCount]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_vertexAttributes;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setDataArrayBuffer:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (char)dataPointer
{
  if (!self->_usesMetalBuffer) {
    return self->_gLData;
  }
  id v2 = [(NSArray *)self->_metalDataBuffers objectAtIndexedSubscript:self->_currentBufferIndex];
  v3 = (char *)[v2 contents];

  return v3;
}

- (BOOL)hasUpdatedData
{
  if (![(TSDGPUDataArrayBuffer *)self bufferCount]) {
    return 0;
  }
  unint64_t v3 = 0;
  do
  {
    int64_t v4 = self->_needsUpdateFirstIndex[v3];
    BOOL v5 = v4 != -1;
    if (v4 != -1) {
      break;
    }
    ++v3;
  }
  while (v3 < [(TSDGPUDataArrayBuffer *)self bufferCount]);
  return v5;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (float)metalFloatForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (__int16 *)&self->_gLData[[(TSDGPUDataArrayBuffer *)self p_bufferOffsetOfAttribute:v6 atIndex:a4 component:0]];
  uint64_t v8 = [v6 dataType];
  int v9 = [v6 isNormalized];

  return TSDGPUDataBufferMetalfloatWithDataType(v7, v8, v9, v10);
}

- (void)setMetalFloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  int v9 = &self->_gLData[[(TSDGPUDataArrayBuffer *)self p_bufferOffsetOfAttribute:v8 atIndex:a5 component:0]];
  uint64_t v10 = [v8 dataType];
  int v11 = [v8 isNormalized];

  TSDGPUDataBufferSetMetalfloatWithDataType(v9, v10, v11, a3);

  [(TSDGPUDataArrayBuffer *)self addIndexNeedsUpdate:a5];
}

- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  *(float *)&a3 = a3;
  [(TSDGPUDataArrayBuffer *)self setMetalFloat:a4 forAttribute:a5 atIndex:a3];
}

- ($94F468A8D4C62B317260615823C2B210)metalPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (__int16 *)&self->_gLData[[(TSDGPUDataArrayBuffer *)self p_bufferOffsetOfAttribute:v6 atIndex:a4 component:0]];
  uint64_t v8 = [v6 dataType];
  int v9 = [v6 isNormalized];

  float v11 = TSDGPUDataBufferMetalPoint2DWithDataType(v7, v8, v9, v10);
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)setMetalPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v9 = a4;
  float v10 = &self->_gLData[[(TSDGPUDataArrayBuffer *)self p_bufferOffsetOfAttribute:v9 atIndex:a5 component:0]];
  uint64_t v11 = [v9 dataType];
  int v12 = [v9 isNormalized];

  TSDGPUDataBufferSetMetalPoint2DWithDataType((uint64_t)v10, v11, v12, var0, var1);

  [(TSDGPUDataArrayBuffer *)self addIndexNeedsUpdate:a5];
}

- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (__int16 *)&self->_gLData[[(TSDGPUDataArrayBuffer *)self p_bufferOffsetOfAttribute:v6 atIndex:a4 component:0]];
  uint64_t v8 = [v6 dataType];
  int v9 = [v6 isNormalized];

  float v11 = TSDGPUDataBufferMetalPoint3DWithDataType(v7, v8, v9, v10);
  result.var2 = v13;
  result.float var1 = v12;
  result.float var0 = v11;
  return result;
}

- (void)setMetalPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v10 = a4;
  float v11 = &self->_gLData[[(TSDGPUDataArrayBuffer *)self p_bufferOffsetOfAttribute:v10 atIndex:a5 component:0]];
  uint64_t v12 = [v10 dataType];
  int v13 = [v10 isNormalized];

  TSDGPUDataBufferSetMetalPoint3DWithDataType((uint64_t)v11, v12, v13, var0, var1, var2);

  [(TSDGPUDataArrayBuffer *)self addIndexNeedsUpdate:a5];
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)metalPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = (int16x4_t *)&self->_gLData[[(TSDGPUDataArrayBuffer *)self p_bufferOffsetOfAttribute:v6 atIndex:a4 component:0]];
  uint64_t v8 = [v6 dataType];
  unsigned int v9 = [v6 isNormalized];

  LODWORD(v10) = TSDGPUDataBufferMetalPoint4DWithDataType(v7, v8, v9).u32[0];
  result.var3 = v13;
  result.float var2 = v12;
  result.float var1 = v11;
  result.float var0 = v10;
  return result;
}

- (void)setMetalPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var3 = a3.var3;
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v11 = a4;
  float v12 = &self->_gLData[[(TSDGPUDataArrayBuffer *)self p_bufferOffsetOfAttribute:v11 atIndex:a5 component:0]];
  uint64_t v13 = [v11 dataType];
  int v14 = [v11 isNormalized];

  TSDGPUDataBufferSetMetalPoint4DWithDataType((uint64_t)v12, v13, v14, var0, var1, var2, var3);

  [(TSDGPUDataArrayBuffer *)self addIndexNeedsUpdate:a5];
}

- (NSString)description
{
  unint64_t v3 = [MEMORY[0x263EFF980] array];
  unsigned int bufferUsage = self->_bufferUsage;
  switch(bufferUsage)
  {
    case 0x88E0u:
      BOOL v5 = @"METAL_STREAM_DRAW";
      break;
    case 0x88E8u:
      BOOL v5 = @"METAL_DYNAMIC_DRAW";
      break;
    case 0x88E4u:
      BOOL v5 = @"METAL_STATIC_DRAW";
      break;
    default:
      BOOL v5 = @"UNKNOWN";
      break;
  }
  id v6 = [NSString stringWithFormat:@"bufferUsage:%@", v5];
  [v3 addObject:v6];

  unint64_t v7 = self->_vertexCount * [(TSDGPUDataArrayBuffer *)self dataBufferEntrySize];
  if (v7 > 0x100000)
  {
    uint64_t v8 = @"(%0.1fMB)";
    double v9 = 0.000000953674316;
LABEL_12:
    float v10 = objc_msgSend(NSString, "stringWithFormat:", v8, v9 * (double)v7);
    goto LABEL_14;
  }
  if (v7 >= 0x401)
  {
    uint64_t v8 = @"(%0.1fKB)";
    double v9 = 0.0009765625;
    goto LABEL_12;
  }
  float v10 = 0;
LABEL_14:
  id v11 = [NSString stringWithFormat:@"bufferSize:%ldB%@", v7, v10];
  [v3 addObject:v11];

  float v12 = [NSString stringWithFormat:@"attributes:%@", self->_vertexAttributes];
  [v3 addObject:v12];

  if ([(TSDGPUDataArrayBuffer *)self bufferCount] != 1)
  {
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"bufferCount:%d", -[TSDGPUDataArrayBuffer bufferCount](self, "bufferCount"));
    [v3 addObject:v13];
  }
  int v14 = NSString;
  v19.receiver = self;
  v19.super_class = (Class)TSDGPUDataArrayBuffer;
  v15 = [(TSDGPUDataArrayBuffer *)&v19 description];
  id v16 = [v3 componentsJoinedByString:@","];
  uint64_t v17 = [v14 stringWithFormat:@"%@: {%@}", v15, v16];

  return (NSString *)v17;
}

- (unint64_t)dataBufferEntrySize
{
  return self->_dataBufferEntrySize;
}

- (unint64_t)bufferCount
{
  return self->_bufferCount;
}

- (unint64_t)currentBufferIndex
{
  return self->_currentBufferIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDataBuffers, 0);
  objc_storeStrong((id *)&self->_attributeOffsetsDictionary, 0);

  objc_storeStrong((id *)&self->_vertexAttributes, 0);
}

@end