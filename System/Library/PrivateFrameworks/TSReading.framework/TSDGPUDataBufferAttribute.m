@interface TSDGPUDataBufferAttribute
+ (id)attributeWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7;
- (BOOL)isNormalized;
- (NSString)name;
- (TSDGPUDataArrayBuffer)dataArrayBuffer;
- (TSDGPUDataBuffer)dataBuffer;
- (TSDGPUDataBufferAttribute)initWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7;
- (id)description;
- (int)componentCount;
- (int)locationInShader;
- (int64_t)dataType;
- (unint64_t)bufferOffset;
- (unsigned)bufferUsage;
- (void)setBufferOffset:(unint64_t)a3;
- (void)setBufferUsage:(unsigned int)a3;
- (void)setComponentCount:(int)a3;
- (void)setDataArrayBuffer:(id)a3;
- (void)setDataBuffer:(id)a3;
- (void)setLocationInShader:(int)a3;
- (void)setName:(id)a3;
@end

@implementation TSDGPUDataBufferAttribute

+ (id)attributeWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7
{
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  v12 = [[TSDGPUDataBufferAttribute alloc] initWithName:v11 bufferUsage:v10 dataType:a5 normalized:v8 componentCount:a7];

  return v12;
}

- (TSDGPUDataBufferAttribute)initWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7
{
  int v7 = a7;
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TSDGPUDataBufferAttribute;
  v13 = [(TSDGPUDataBufferAttribute *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(TSDGPUDataBufferAttribute *)v13 setName:v12];
    int64_t v15 = 5;
    if (a5 != 3) {
      int64_t v15 = a5;
    }
    v14->_dataType = v15;
    v14->_bufferUsage = a4;
    v14->_componentCount = v7;
    v14->_isNormalized = a6;
    v14->_locationInShader = -1;
  }

  return v14;
}

- (void)setBufferUsage:(unsigned int)a3
{
  self->_bufferUsage = a3;
}

- (void)setComponentCount:(int)a3
{
  self->_componentCount = a3;
}

- (id)description
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = NSString;
  v5 = [(TSDGPUDataBufferAttribute *)self name];
  v6 = [v4 stringWithFormat:@"\"%@\"", v5];
  [v3 addObject:v6];

  unint64_t v7 = [(TSDGPUDataBufferAttribute *)self dataType];
  if (v7 > 5) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = off_2646B1E48[v7];
  }
  v9 = [NSString stringWithFormat:@"dataType:%@", v8];
  [v3 addObject:v9];

  uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"components:%d", -[TSDGPUDataBufferAttribute componentCount](self, "componentCount"));
  [v3 addObject:v10];

  unsigned int v11 = [(TSDGPUDataBufferAttribute *)self bufferUsage];
  switch(v11)
  {
    case 0x88E0u:
      id v12 = @"METAL_STREAM_DRAW";
      break;
    case 0x88E8u:
      id v12 = @"METAL_DYNAMIC_DRAW";
      break;
    case 0x88E4u:
      id v12 = @"METAL_STATIC_DRAW";
      break;
    default:
      id v12 = @"UNKNOWN";
      break;
  }
  v13 = [NSString stringWithFormat:@"bufferUsage:%@", v12];
  [v3 addObject:v13];

  if ([(TSDGPUDataBufferAttribute *)self isNormalized]) {
    [v3 addObject:@"normalized"];
  }
  v14 = NSString;
  v19.receiver = self;
  v19.super_class = (Class)TSDGPUDataBufferAttribute;
  int64_t v15 = [(TSDGPUDataBufferAttribute *)&v19 description];
  v16 = [v3 componentsJoinedByString:@","];
  objc_super v17 = [v14 stringWithFormat:@"%@: {%@}", v15, v16];

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unsigned)bufferUsage
{
  return self->_bufferUsage;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (int)componentCount
{
  return self->_componentCount;
}

- (BOOL)isNormalized
{
  return self->_isNormalized;
}

- (int)locationInShader
{
  return self->_locationInShader;
}

- (void)setLocationInShader:(int)a3
{
  self->_locationInShader = a3;
}

- (unint64_t)bufferOffset
{
  return self->_bufferOffset;
}

- (void)setBufferOffset:(unint64_t)a3
{
  self->_bufferOffset = a3;
}

- (TSDGPUDataArrayBuffer)dataArrayBuffer
{
  return self->_dataArrayBuffer;
}

- (void)setDataArrayBuffer:(id)a3
{
  self->_dataArrayBuffer = (TSDGPUDataArrayBuffer *)a3;
}

- (TSDGPUDataBuffer)dataBuffer
{
  return self->_dataBuffer;
}

- (void)setDataBuffer:(id)a3
{
  self->_dataBuffer = (TSDGPUDataBuffer *)a3;
}

- (void).cxx_destruct
{
}

@end