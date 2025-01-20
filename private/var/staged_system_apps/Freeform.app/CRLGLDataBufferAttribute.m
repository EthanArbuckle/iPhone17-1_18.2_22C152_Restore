@interface CRLGLDataBufferAttribute
+ (id)attributeWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7;
- (BOOL)isNormalized;
- (CRLGLDataArrayBuffer)dataArrayBuffer;
- (CRLGLDataBufferAttribute)initWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7;
- (CRLGPUDataBuffer)dataBuffer;
- (NSString)name;
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

@implementation CRLGLDataBufferAttribute

+ (id)attributeWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7
{
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  id v11 = a3;
  v12 = [[CRLGLDataBufferAttribute alloc] initWithName:v11 bufferUsage:v10 dataType:a5 normalized:v8 componentCount:a7];

  return v12;
}

- (CRLGLDataBufferAttribute)initWithName:(id)a3 bufferUsage:(unsigned int)a4 dataType:(int64_t)a5 normalized:(BOOL)a6 componentCount:(unint64_t)a7
{
  int v7 = a7;
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRLGLDataBufferAttribute;
  v13 = [(CRLGLDataBufferAttribute *)&v17 init];
  v14 = v13;
  if (v13)
  {
    [(CRLGLDataBufferAttribute *)v13 setName:v12];
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
  v3 = +[NSMutableArray array];
  v4 = [(CRLGLDataBufferAttribute *)self name];
  v5 = +[NSString stringWithFormat:@"\"%@\"", v4];
  [v3 addObject:v5];

  unint64_t v6 = [(CRLGLDataBufferAttribute *)self dataType];
  if (v6 > 5) {
    int v7 = 0;
  }
  else {
    int v7 = off_1014D33F8[v6];
  }
  BOOL v8 = +[NSString stringWithFormat:@"dataType:%@", v7];
  [v3 addObject:v8];

  v9 = +[NSString stringWithFormat:@"components:%d", [(CRLGLDataBufferAttribute *)self componentCount]];
  [v3 addObject:v9];

  unsigned int v10 = [(CRLGLDataBufferAttribute *)self bufferUsage];
  switch(v10)
  {
    case 0x88E0u:
      CFStringRef v11 = @"GL_STREAM_DRAW";
      break;
    case 0x88E8u:
      CFStringRef v11 = @"GL_DYNAMIC_DRAW";
      break;
    case 0x88E4u:
      CFStringRef v11 = @"GL_STATIC_DRAW";
      break;
    default:
      CFStringRef v11 = @"UNKNOWN";
      break;
  }
  id v12 = +[NSString stringWithFormat:@"bufferUsage:%@", v11];
  [v3 addObject:v12];

  if ([(CRLGLDataBufferAttribute *)self isNormalized]) {
    [v3 addObject:@"normalized"];
  }
  v17.receiver = self;
  v17.super_class = (Class)CRLGLDataBufferAttribute;
  v13 = [(CRLGLDataBufferAttribute *)&v17 description];
  v14 = [v3 componentsJoinedByString:@","];
  int64_t v15 = +[NSString stringWithFormat:@"%@: {%@}", v13, v14];

  return v15;
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

- (CRLGLDataArrayBuffer)dataArrayBuffer
{
  return self->_dataArrayBuffer;
}

- (void)setDataArrayBuffer:(id)a3
{
  self->_dataArrayBuffer = (CRLGLDataArrayBuffer *)a3;
}

- (CRLGPUDataBuffer)dataBuffer
{
  return self->_dataBuffer;
}

- (void)setDataBuffer:(id)a3
{
  self->_dataBuffer = (CRLGPUDataBuffer *)a3;
}

- (void).cxx_destruct
{
}

@end