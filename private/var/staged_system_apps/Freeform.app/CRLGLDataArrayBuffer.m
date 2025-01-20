@interface CRLGLDataArrayBuffer
- ($94F468A8D4C62B317260615823C2B210)GLPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)GLPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- ($E2C29196C7A5C696474C6955C5A9CE06)GLPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)hasUpdatedData;
- (CRLGLDataArrayBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 bufferCount:(unint64_t)a5;
- (NSString)description;
- (char)dataPointer;
- (float)GLfloatForAttribute:(id)a3 atIndex:(unint64_t)a4;
- (unint64_t)bufferCount;
- (unint64_t)currentBufferIndex;
- (unint64_t)dataBufferEntrySize;
- (unint64_t)p_bufferOffsetOfAttribute:(id)a3 atIndex:(unint64_t)a4 component:(unint64_t)a5;
- (unint64_t)vertexCount;
- (void)addAllIndexesNeedUpdate;
- (void)addIndexNeedsUpdate:(int64_t)a3;
- (void)addIndexRangeNeedsUpdate:(_NSRange)a3;
- (void)dealloc;
- (void)enableArrayBufferWithDevice:(id)a3;
- (void)encodeArrayBufferWithEncoder:(id)a3 atIndex:(int64_t)a4;
- (void)p_setupGLDataBufferIfNecessary;
- (void)p_setupMetalDataBufferIfNecessaryWithDevice:(id)a3;
- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setCurrentBufferIndex:(unint64_t)a3;
- (void)setGLPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setGLPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setGLPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setGLfloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)swapGPUDataBuffers;
- (void)updateDataBufferIfNecessary;
@end

@implementation CRLGLDataArrayBuffer

- (void)p_setupGLDataBufferIfNecessary
{
  if (!self->_dataBufferHasBeenSetup)
  {
    self->_gLDataBuffers = (unsigned int *)malloc_type_malloc(4 * [(CRLGLDataArrayBuffer *)self bufferCount], 0x100004052888210uLL);
    glGenBuffers((GLsizei)[(CRLGLDataArrayBuffer *)self bufferCount], self->_gLDataBuffers);
    if (!*self->_gLDataBuffers)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2FD8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101074370();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D2FF8);
      }
      v3 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v3);
      }
      v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGLDataArrayBuffer p_setupGLDataBufferIfNecessary]");
      v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
      +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:531 isFatal:0 description:"Unable to generate buffer(s)!"];
    }
    if ([(CRLGLDataArrayBuffer *)self bufferCount])
    {
      unint64_t v6 = 0;
      do
      {
        glBindBuffer(0x8892u, self->_gLDataBuffers[v6]);
        glBufferData(0x8892u, self->_vertexCount * [(CRLGLDataArrayBuffer *)self dataBufferEntrySize], self->_gLData, self->_bufferUsage);
        needsUpdateLastIndex = self->_needsUpdateLastIndex;
        self->_needsUpdateFirstIndex[v6] = -1;
        needsUpdateLastIndex[v6++] = -1;
      }
      while (v6 < [(CRLGLDataArrayBuffer *)self bufferCount]);
    }
    self->_dataBufferHasBeenSetup = 1;
  }
}

- (void)updateDataBufferIfNecessary
{
  [(CRLGLDataArrayBuffer *)self p_setupGLDataBufferIfNecessary];
  if ([(CRLGLDataArrayBuffer *)self hasUpdatedData])
  {
    if (self->_bufferUsage == 35044)
    {
      if (qword_101719A68 != -1) {
        dispatch_once(&qword_101719A68, &stru_1014D3018);
      }
      v3 = off_10166B498;
      if (os_log_type_enabled((os_log_t)off_10166B498, OS_LOG_TYPE_ERROR)) {
        sub_1010743F8(v3);
      }
    }
    else
    {
      if ([(CRLGLDataArrayBuffer *)self bufferCount])
      {
        unint64_t v4 = 0;
        uint64_t v5 = -1;
        uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          int64_t v8 = self->_needsUpdateFirstIndex[v4];
          if (v6 >= v8) {
            int64_t v9 = self->_needsUpdateFirstIndex[v4];
          }
          else {
            int64_t v9 = v6;
          }
          BOOL v10 = v8 == -1;
          needsUpdateLastIndex = self->_needsUpdateLastIndex;
          uint64_t v11 = needsUpdateLastIndex[v4];
          if (!v10) {
            uint64_t v6 = v9;
          }
          if (v5 <= v11) {
            int64_t v12 = needsUpdateLastIndex[v4];
          }
          else {
            int64_t v12 = v5;
          }
          if (v11 != -1) {
            uint64_t v5 = v12;
          }
          ++v4;
        }
        while (v4 < [(CRLGLDataArrayBuffer *)self bufferCount]);
        uint64_t v13 = v5 + 1;
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v14 = v13 - v6;
      GLintptr v15 = [(CRLGLDataArrayBuffer *)self dataBufferEntrySize] * v6;
      GLsizeiptr v16 = [(CRLGLDataArrayBuffer *)self dataBufferEntrySize] * v14;
      glBindBuffer(0x8892u, self->_gLDataBuffers[[(CRLGLDataArrayBuffer *)self currentBufferIndex]]);
      glBufferSubData(0x8892u, v15, v16, self->_gLData);
      needsUpdateFirstIndex = self->_needsUpdateFirstIndex;
      needsUpdateFirstIndex[[(CRLGLDataArrayBuffer *)self currentBufferIndex]] = -1;
      v18 = self->_needsUpdateLastIndex;
      v18[[(CRLGLDataArrayBuffer *)self currentBufferIndex]] = -1;
    }
  }
}

- (void)p_setupMetalDataBufferIfNecessaryWithDevice:(id)a3
{
  id v4 = a3;
  if (!self->_dataBufferHasBeenSetup)
  {
    id v16 = v4;
    unint64_t vertexCount = self->_vertexCount;
    unint64_t v6 = [(CRLGLDataArrayBuffer *)self dataBufferEntrySize] * vertexCount;
    if (v6 > 0xFFF)
    {
      v7 = +[NSMutableArray arrayWithCapacity:[(CRLGLDataArrayBuffer *)self bufferCount]];
      unint64_t v8 = [(CRLGLDataArrayBuffer *)self bufferCount];
      int64_t v9 = v16;
      if (v8)
      {
        for (unint64_t i = 0; i < v12; ++i)
        {
          id v11 = [v9 newBufferWithBytes:self->_gLData length:v6 options:0];
          [v7 addObject:v11];

          unint64_t v12 = [(CRLGLDataArrayBuffer *)self bufferCount];
          int64_t v9 = v16;
        }
      }
      uint64_t v13 = (NSArray *)[v7 copy];
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
  unint64_t v9 = [(CRLGLDataArrayBuffer *)self dataBufferEntrySize];
  BOOL v10 = (char *)[v8 bufferOffset] + v9 * a4;
  if (a5) {
    v10 += sub_1000BECA8((uint64_t)[v8 dataType]) * a5;
  }

  return (unint64_t)v10;
}

- (CRLGLDataArrayBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 bufferCount:(unint64_t)a5
{
  id v8 = a3;
  if ([v8 count])
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3038);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107454C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3058);
    }
    unint64_t v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    BOOL v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGLDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]");
    id v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v10 file:v11 lineNumber:641 isFatal:0 description:"no attributes!"];

    if (a4)
    {
LABEL_3:
      if (a5) {
        goto LABEL_32;
      }
      goto LABEL_23;
    }
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D3078);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010744C4();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D3098);
  }
  unint64_t v12 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v12);
  }
  uint64_t v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGLDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]");
  uint64_t v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
  +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:642 isFatal:0 description:"vertexCount==0!"];

  if (!a5)
  {
LABEL_23:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D30B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107443C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D30D8);
    }
    GLintptr v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v15);
    }
    id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGLDataArrayBuffer initWithVertexAttributes:vertexCount:bufferCount:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:643 isFatal:0 description:"bufferCount==0!"];
  }
LABEL_32:
  id v18 = [v8 count];
  v19 = 0;
  if (a5 && a4 && v18)
  {
    v42.receiver = self;
    v42.super_class = (Class)CRLGLDataArrayBuffer;
    v20 = [(CRLGLDataArrayBuffer *)&v42 init];
    if (v20)
    {
      v21 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v8];
      vertexAttributes = v20->_vertexAttributes;
      v20->_vertexAttributes = v21;

      v20->_unint64_t vertexCount = a4;
      v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      attributeOffsetsDictionary = v20->_attributeOffsetsDictionary;
      v20->_attributeOffsetsDictionary = v23;

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v25 = v20->_vertexAttributes;
      id v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v26)
      {
        id v27 = v26;
        id v37 = v8;
        int v28 = 0;
        uint64_t v29 = *(void *)v39;
        do
        {
          for (unint64_t i = 0; i != v27; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v39 != v29) {
              objc_enumerationMutation(v25);
            }
            v31 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            [v31 setDataArrayBuffer:v20];
            int v32 = sub_1000BECA8((uint64_t)[v31 dataType]);
            if (!v20->_bufferUsage) {
              v20->_bufferUsage = [v31 bufferUsage];
            }
            [v31 setBufferOffset:v28];
            v28 += (v32 * [v31 componentCount] + 3) & 0xFFFFFFFC;
            [v31 componentCount];
          }
          id v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v27);
        unint64_t v33 = v28;
        id v8 = v37;
      }
      else
      {
        unint64_t v33 = 0;
      }

      v20->_dataBufferEntrySize = v33;
      if ([(CRLGLDataArrayBuffer *)v20 dataBufferEntrySize]) {
        v20->_gLData = (char *)malloc_type_calloc(v20->_vertexCount, [(CRLGLDataArrayBuffer *)v20 dataBufferEntrySize], 0x981949BuLL);
      }
      v20->_bufferCount = a5;
      v20->_needsUpdateFirstIndex = (int64_t *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
      v34 = (int64_t *)malloc_type_malloc(8 * a5, 0x100004000313F17uLL);
      v20->_needsUpdateLastIndex = v34;
      needsUpdateFirstIndex = v20->_needsUpdateFirstIndex;
      do
      {
        *needsUpdateFirstIndex++ = -1;
        *v34++ = -1;
        --a5;
      }
      while (a5);
    }
    self = v20;
    v19 = self;
  }

  return v19;
}

- (void)dealloc
{
  free(self->_needsUpdateFirstIndex);
  free(self->_needsUpdateLastIndex);
  if (self->_gLDataBuffers)
  {
    glDeleteBuffers((GLsizei)[(CRLGLDataArrayBuffer *)self bufferCount], self->_gLDataBuffers);
    gLDataBuffers = self->_gLDataBuffers;
    if (gLDataBuffers)
    {
      free(gLDataBuffers);
      self->_gLDataBuffers = 0;
    }
  }
  gLData = self->_gLData;
  if (gLData)
  {
    free(gLData);
    self->_gLData = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CRLGLDataArrayBuffer;
  [(CRLGLDataArrayBuffer *)&v5 dealloc];
}

- (void)addAllIndexesNeedUpdate
{
}

- (void)addIndexRangeNeedsUpdate:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  -[CRLGLDataArrayBuffer addIndexNeedsUpdate:](self, "addIndexNeedsUpdate:");

  [(CRLGLDataArrayBuffer *)self addIndexNeedsUpdate:length + location - 1];
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

- (void)enableArrayBufferWithDevice:(id)a3
{
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
    [v8 setVertexBuffer:offset:atIndex:];
  }
}

- (void)setCurrentBufferIndex:(unint64_t)a3
{
  self->_unint64_t currentBufferIndex = a3;
}

- (void)swapGPUDataBuffers
{
  [(CRLGLDataArrayBuffer *)self setCurrentBufferIndex:([(CRLGLDataArrayBuffer *)self currentBufferIndex] + 1)% [(CRLGLDataArrayBuffer *)self bufferCount]];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = self->_vertexAttributes;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      int64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) setDataArrayBuffer:self v8];
        int64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
  if (![(CRLGLDataArrayBuffer *)self bufferCount]) {
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
  while (v3 < [(CRLGLDataArrayBuffer *)self bufferCount]);
  return v5;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (float)GLfloatForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  int64_t v7 = &self->_gLData[[(CRLGLDataArrayBuffer *)self p_bufferOffsetOfAttribute:v6 atIndex:a4 component:0]];
  id v8 = [v6 dataType];
  int v9 = [v6 isNormalized];

  return sub_1000BEED8(v7, (uint64_t)v8, v9, v10);
}

- (void)setGLfloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  int v9 = &self->_gLData[[(CRLGLDataArrayBuffer *)self p_bufferOffsetOfAttribute:v8 atIndex:a5 component:0]];
  id v10 = [v8 dataType];
  int v11 = [v8 isNormalized];

  sub_1000BF150(v9, (uint64_t)v10, v11, a3);

  [(CRLGLDataArrayBuffer *)self addIndexNeedsUpdate:a5];
}

- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  *(float *)&a3 = a3;
  [(CRLGLDataArrayBuffer *)self setGLfloat:a4 forAttribute:a5 atIndex:a3];
}

- ($94F468A8D4C62B317260615823C2B210)GLPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  int64_t v7 = &self->_gLData[[(CRLGLDataArrayBuffer *)self p_bufferOffsetOfAttribute:v6 atIndex:a4 component:0]];
  id v8 = [v6 dataType];
  int v9 = [v6 isNormalized];

  float v11 = sub_1000BF3B8(v7, (uint64_t)v8, v9, v10);
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)setGLPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v9 = a4;
  float v10 = &self->_gLData[[(CRLGLDataArrayBuffer *)self p_bufferOffsetOfAttribute:v9 atIndex:a5 component:0]];
  id v11 = [v9 dataType];
  int v12 = [v9 isNormalized];

  sub_1000BF684((uint64_t)v10, (uint64_t)v11, v12, var0, var1);

  [(CRLGLDataArrayBuffer *)self addIndexNeedsUpdate:a5];
}

- ($E2C29196C7A5C696474C6955C5A9CE06)GLPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  int64_t v7 = &self->_gLData[[(CRLGLDataArrayBuffer *)self p_bufferOffsetOfAttribute:v6 atIndex:a4 component:0]];
  id v8 = [v6 dataType];
  int v9 = [v6 isNormalized];

  float v11 = sub_1000BF950(v7, (uint64_t)v8, v9, v10);
  result.var2 = v13;
  result.float var1 = v12;
  result.float var0 = v11;
  return result;
}

- (void)setGLPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v10 = a4;
  float v11 = &self->_gLData[[(CRLGLDataArrayBuffer *)self p_bufferOffsetOfAttribute:v10 atIndex:a5 component:0]];
  id v12 = [v10 dataType];
  int v13 = [v10 isNormalized];

  sub_1000BFC70((uint64_t)v11, (uint64_t)v12, v13, var0, var1, var2);

  [(CRLGLDataArrayBuffer *)self addIndexNeedsUpdate:a5];
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)GLPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  int64_t v7 = (int16x4_t *)&self->_gLData[[(CRLGLDataArrayBuffer *)self p_bufferOffsetOfAttribute:v6 atIndex:a4 component:0]];
  id v8 = [v6 dataType];
  unsigned int v9 = [v6 isNormalized];

  LODWORD(v10) = sub_1000BFF78(v7, (uint64_t)v8, v9).u32[0];
  result.var3 = v13;
  result.float var2 = v12;
  result.float var1 = v11;
  result.float var0 = v10;
  return result;
}

- (void)setGLPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var3 = a3.var3;
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v11 = a4;
  float v12 = &self->_gLData[[(CRLGLDataArrayBuffer *)self p_bufferOffsetOfAttribute:v11 atIndex:a5 component:0]];
  id v13 = [v11 dataType];
  int v14 = [v11 isNormalized];

  sub_1000C022C((uint64_t)v12, (uint64_t)v13, v14, var0, var1, var2, var3);

  [(CRLGLDataArrayBuffer *)self addIndexNeedsUpdate:a5];
}

- (NSString)description
{
  unint64_t v3 = +[NSMutableArray array];
  unsigned int bufferUsage = self->_bufferUsage;
  switch(bufferUsage)
  {
    case 0x88E0u:
      CFStringRef v5 = @"GL_STREAM_DRAW";
      break;
    case 0x88E8u:
      CFStringRef v5 = @"GL_DYNAMIC_DRAW";
      break;
    case 0x88E4u:
      CFStringRef v5 = @"GL_STATIC_DRAW";
      break;
    default:
      CFStringRef v5 = @"UNKNOWN";
      break;
  }
  id v6 = +[NSString stringWithFormat:@"bufferUsage:%@", v5];
  [v3 addObject:v6];

  unint64_t v7 = self->_vertexCount * [(CRLGLDataArrayBuffer *)self dataBufferEntrySize];
  if (v7 > 0x100000)
  {
    CFStringRef v8 = @"(%0.1fMB)";
    double v9 = 0.000000953674316;
LABEL_12:
    float v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9 * (double)v7);
    goto LABEL_14;
  }
  if (v7 >= 0x401)
  {
    CFStringRef v8 = @"(%0.1fKB)";
    double v9 = 0.0009765625;
    goto LABEL_12;
  }
  float v10 = 0;
LABEL_14:
  id v11 = +[NSString stringWithFormat:@"bufferSize:%ldB%@", v7, v10];
  [v3 addObject:v11];

  float v12 = +[NSString stringWithFormat:@"attributes:%@", self->_vertexAttributes];
  [v3 addObject:v12];

  if ((id)[(CRLGLDataArrayBuffer *)self bufferCount] != (id)1)
  {
    id v13 = +[NSString stringWithFormat:@"bufferCount:%d", [(CRLGLDataArrayBuffer *)self bufferCount]];
    [v3 addObject:v13];
  }
  v18.receiver = self;
  v18.super_class = (Class)CRLGLDataArrayBuffer;
  int v14 = [(CRLGLDataArrayBuffer *)&v18 description];
  GLintptr v15 = [v3 componentsJoinedByString:@","];
  id v16 = +[NSString stringWithFormat:@"%@: {%@}", v14, v15];

  return (NSString *)v16;
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