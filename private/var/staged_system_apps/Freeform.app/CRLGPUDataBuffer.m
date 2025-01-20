@interface CRLGPUDataBuffer
+ (id)newDataBufferWithVertexAttributes:(id)a3 meshSize:(CGSize)a4;
+ (id)newDataBufferWithVertexAttributes:(id)a3 meshSize:(CGSize)a4 device:(id)a5;
+ (id)newDataBufferWithVertexAttributes:(id)a3 quadParticleCount:(unint64_t)a4;
+ (id)newDataBufferWithVertexAttributes:(id)a3 quadParticleCount:(unint64_t)a4 device:(id)a5;
+ (id)newDataBufferWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5;
+ (id)newDataBufferWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5 device:(id)a6;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 device:(id)a5;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 device:(id)a6;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 device:(id)a7;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8 device:(id)a9;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 device:(id)a8;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 textureFlipped:(BOOL)a5;
+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 textureFlipped:(BOOL)a5 device:(id)a6;
+ (void)p_addTransparentBorderInsetToTextureRect:(CGRect *)a3 vertexRect:(CGRect *)a4;
- ($94F468A8D4C62B317260615823C2B210)GLPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)GLPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- ($E2C29196C7A5C696474C6955C5A9CE06)GLPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)isDynamicallyBuffered;
- (BOOL)p_setAttributeUpdateData:(id *)a3 fromAttribute:(id)a4;
- (CRLGPUDataBuffer)initWithVertexAttributes:(id)a3 meshSize:(CGSize)a4 bufferCount:(unint64_t)a5;
- (CRLGPUDataBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5 bufferCount:(unint64_t)a6;
- (CRLGPUDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8;
- (NSArray)vertexAttributes;
- (NSString)description;
- (float)GLfloatForAttribute:(id)a3 atIndex:(unint64_t)a4;
- (id)vertexAttributeNamed:(id)a3;
- (unint64_t)centerAttributeIndex;
- (unint64_t)metalDrawMode;
- (unint64_t)positionAttributeIndex;
- (unint64_t)texCoordAttributeIndex;
- (unint64_t)vertexCount;
- (unsigned)GLushortForIndexElement:(unint64_t)a3;
- (unsigned)drawMode;
- (void)dealloc;
- (void)disableGLElementArrayBuffer;
- (void)disableWithDevice:(id)a3;
- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4;
- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 advanceDynamicBuffer:(BOOL)a5;
- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 range:(_NSRange)a5;
- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 range:(_NSRange)a5 advanceDynamicBuffer:(BOOL)a6;
- (void)enableDataBuffer;
- (void)enableGLElementArrayBuffer;
- (void)encodeWithEncoder:(id)a3 atIndex:(unint64_t)a4;
- (void)p_setupElementArrayBufferIfNecessary;
- (void)p_setupGLElementArrayBufferIfNecessary;
- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setDataForAttribute:(id)a3 atIndex:(unint64_t)a4 fromAttribute:(id)a5 dataBuffer:(id)a6 index:(unint64_t)a7;
- (void)setDrawMode:(unsigned int)a3;
- (void)setGLPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setGLPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setGLPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setGLfloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setGLushort:(unsigned __int16)a3 forIndexElement:(unint64_t)a4;
- (void)setMetalDrawMode:(unint64_t)a3;
- (void)teardown;
- (void)updateDataBufferAttributes:(id)a3 withBlock:(id)a4;
- (void)updateDataBufferAttributesWithBlock:(id)a3;
- (void)updateMetalDataBufferAttributes:(id)a3 withBlock:(id)a4;
@end

@implementation CRLGPUDataBuffer

- (void)p_setupElementArrayBufferIfNecessary
{
  if (!self->_gLElementDataBufferWasSetup)
  {
    if (self->_gLElementData)
    {
      double width = self->_gLElementMeshSize.width;
      double height = self->_gLElementMeshSize.height;
      if (width != CGSizeZero.width || height != CGSizeZero.height)
      {
        if (height + -1.0 > 0.0)
        {
          uint64_t v6 = 0;
          unint64_t v7 = 0;
          double v8 = 0.0;
          do
          {
            double v9 = (double)++v7;
            if (width > 0.0)
            {
              double v10 = 0.0;
              unint64_t v11 = 1;
              do
              {
                uint64_t v12 = v6 + 1;
                [(CRLGPUDataBuffer *)self setGLushort:(int)(v10 + v8 * width) forIndexElement:v6];
                v6 += 2;
                [(CRLGPUDataBuffer *)self setGLushort:(int)(v10 + v9 * self->_gLElementMeshSize.width) forIndexElement:v12];
                double v10 = (double)v11;
                double width = self->_gLElementMeshSize.width;
                ++v11;
              }
              while (width > v10);
              double height = self->_gLElementMeshSize.height;
            }
            double v8 = (double)v7;
          }
          while (height + -1.0 > v9);
          goto LABEL_24;
        }
        goto LABEL_23;
      }
      if (self->_gLElementQuadParticleCount)
      {
        if (self->_conformsToMetalProtocol) {
          [(CRLGPUDataBuffer *)self setMetalDrawMode:3];
        }
        else {
          [(CRLGPUDataBuffer *)self setDrawMode:4];
        }
        if (self->_gLElementQuadParticleCount)
        {
          uint64_t v13 = 0;
          unint64_t v14 = 0;
          do
          {
            [(CRLGPUDataBuffer *)self setGLushort:4 * (v14 & 0x3FFF) forIndexElement:v13];
            [(CRLGPUDataBuffer *)self setGLushort:(unsigned __int16)(4 * v14) | 1u forIndexElement:v13 + 1];
            [(CRLGPUDataBuffer *)self setGLushort:(4 * v14) & 0xFFFC | 2u forIndexElement:v13 + 2];
            [(CRLGPUDataBuffer *)self setGLushort:4 * (v14 & 0x3FFF) forIndexElement:v13 + 3];
            [(CRLGPUDataBuffer *)self setGLushort:(4 * v14) & 0xFFFC | 2u forIndexElement:v13 + 4];
            uint64_t v6 = v13 + 6;
            [(CRLGPUDataBuffer *)self setGLushort:(unsigned __int16)(4 * v14++) | 3u forIndexElement:v13 + 5];
            v13 += 6;
          }
          while (v14 < self->_gLElementQuadParticleCount);
LABEL_24:
          if (v6 != self->_elementArrayCount)
          {
            +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D30F8);
            }
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_1010745D4();
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D3118);
            }
            v15 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
              sub_10106590C(v15);
            }
            v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer p_setupElementArrayBufferIfNecessary]");
            v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
            +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:948 isFatal:0 description:"Element array count Sanity check"];
          }
          goto LABEL_34;
        }
LABEL_23:
        uint64_t v6 = 0;
        goto LABEL_24;
      }
    }
LABEL_34:
    self->_gLElementDataBufferWasSetup = 1;
  }
}

- (void)p_setupGLElementArrayBufferIfNecessary
{
  if (!self->_gLElementDataBufferWasSetup)
  {
    if (self->_gLElementData)
    {
      [(CRLGPUDataBuffer *)self p_setupElementArrayBufferIfNecessary];
      glGenBuffers(1, &self->_gLElementDataBuffer);
      GLuint gLElementDataBuffer = self->_gLElementDataBuffer;
      if (!gLElementDataBuffer)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D3138);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10107465C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D3158);
        }
        v4 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10106590C(v4);
        }
        v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer p_setupGLElementArrayBufferIfNecessary]");
        uint64_t v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
        +[CRLAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:971 isFatal:0 description:"Unable to generate buffer!"];

        GLuint gLElementDataBuffer = self->_gLElementDataBuffer;
      }
      glBindBuffer(0x8893u, gLElementDataBuffer);
      glBufferData(0x8893u, 2 * self->_elementArrayCount, self->_gLElementData, 0x88E4u);
      gLElementData = self->_gLElementData;
      if (gLElementData)
      {
        free(gLElementData);
        self->_gLElementData = 0;
      }
    }
    else
    {
      self->_gLElementDataBufferWasSetup = 1;
    }
  }
}

- (CRLGPUDataBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5 bufferCount:(unint64_t)a6
{
  id v10 = a3;
  unint64_t v54 = a4;
  if (a4 < 0xFFFF)
  {
    v65.receiver = self;
    v65.super_class = (Class)CRLGPUDataBuffer;
    v15 = [(CRLGPUDataBuffer *)&v65 init];
    v16 = v15;
    if (v15)
    {
      unint64_t count = a5;
      [(CRLGPUDataBuffer *)v15 setDrawMode:5];
      [(CRLGPUDataBuffer *)v16 setMetalDrawMode:4];
      v17 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v10];
      vertexAttributes = v16->_vertexAttributes;
      v16->_vertexAttributes = v17;

      v16->_vertexCount = a4;
      v19 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      arrayBuffers = v16->_arrayBuffers;
      v16->_arrayBuffers = v19;

      v21 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSArray count](v16->_vertexAttributes, "count")];
      attributeToArrayBuffersDictionary = v16->_attributeToArrayBuffersDictionary;
      v16->_attributeToArrayBuffersDictionary = v21;

      v16->_isDynamicallyBuffered = 1;
      id v52 = v10;
      v53 = +[NSMutableArray arrayWithArray:v10];
      if ([v53 count])
      {
        *(void *)&long long v23 = 67109378;
        long long v50 = v23;
        do
        {
          v24 = [v53 objectAtIndex:0];
          v25 = +[NSMutableArray array];
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v26 = v53;
          id v27 = [v26 countByEnumeratingWithState:&v61 objects:v75 count:16];
          if (v27)
          {
            id v28 = v27;
            uint64_t v29 = *(void *)v62;
            do
            {
              for (i = 0; i != v28; i = (char *)i + 1)
              {
                if (*(void *)v62 != v29) {
                  objc_enumerationMutation(v26);
                }
                v31 = *(void **)(*((void *)&v61 + 1) + 8 * i);
                unsigned int v32 = [v31 bufferUsage];
                if (v32 == [v24 bufferUsage]) {
                  [v25 addObject:v31];
                }
              }
              id v28 = [v26 countByEnumeratingWithState:&v61 objects:v75 count:16];
            }
            while (v28);
          }

          if ([v24 bufferUsage] == 35044)
          {
            v16->_isDynamicallyBuffered = 0;
            a6 = 1;
          }
          v33 = [[CRLGLDataArrayBuffer alloc] initWithVertexAttributes:v25 vertexCount:v54 bufferCount:a6];
          if (v33)
          {
            v55 = v25;
            unint64_t v56 = a6;
            long long v59 = 0u;
            long long v60 = 0u;
            long long v57 = 0u;
            long long v58 = 0u;
            id v34 = v25;
            id v35 = [v34 countByEnumeratingWithState:&v57 objects:v66 count:16];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = *(void *)v58;
              do
              {
                for (j = 0; j != v36; j = (char *)j + 1)
                {
                  if (*(void *)v58 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  v39 = *(void **)(*((void *)&v57 + 1) + 8 * (void)j);
                  [v39 setDataBuffer:v16];
                  v40 = v16->_attributeToArrayBuffersDictionary;
                  v41 = [v39 name];
                  [(NSMutableDictionary *)v40 setObject:v33 forKey:v41];
                }
                id v36 = [v34 countByEnumeratingWithState:&v57 objects:v66 count:16];
              }
              while (v36);
            }

            [(NSMutableArray *)v16->_arrayBuffers addObject:v33];
            v25 = v55;
            a6 = v56;
          }
          else
          {
            unsigned int v42 = +[CRLAssertionHandler _atomicIncrementAssertCount];
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D31B8);
            }
            v43 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              unsigned int v68 = v42;
              __int16 v69 = 2082;
              v70 = "-[CRLGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:]";
              __int16 v71 = 2082;
              v72 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m";
              __int16 v73 = 1024;
              int v74 = 1023;
              _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Error creating array buffer!", buf, 0x22u);
            }
            if (qword_101719A70 != -1) {
              dispatch_once(&qword_101719A70, &stru_1014D31D8);
            }
            v44 = off_10166B4A0;
            if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
            {
              v47 = v44;
              v48 = +[CRLAssertionHandler packedBacktraceString];
              *(_DWORD *)buf = v50;
              unsigned int v68 = v42;
              __int16 v69 = 2114;
              v70 = v48;
              _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
            }
            v45 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:]");
            v46 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
            +[CRLAssertionHandler handleFailureInFunction:v45 file:v46 lineNumber:1023 isFatal:0 description:"Error creating array buffer!"];
          }
          [v26 removeObjectsInArray:v25];
        }
        while ([v26 count]);
      }
      if (count)
      {
        v16->_elementArrayCount = count;
        v16->_gLElementData = (unsigned __int16 *)malloc_type_calloc(count, 2uLL, 0x1000040BDFB0063uLL);
      }

      id v10 = v52;
    }
    self = v16;
    unint64_t v14 = self;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3178);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010746E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3198);
    }
    unint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:]");
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:988 isFatal:0 description:"Too many vertices!"];

    unint64_t v14 = 0;
  }

  return v14;
}

- (CRLGPUDataBuffer)initWithVertexAttributes:(id)a3 meshSize:(CGSize)a4 bufferCount:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  if (width <= 1.0 || height <= 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D31F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10107476C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3218);
    }
    unint64_t v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    uint64_t v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer initWithVertexAttributes:meshSize:bufferCount:]");
    uint64_t v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:1045 isFatal:0 description:"Mesh size is not at least 2x2!"];
  }
  unint64_t v14 = [(CRLGPUDataBuffer *)self initWithVertexAttributes:v9 vertexCount:(unint64_t)(width * height) indexElementCount:(unint64_t)((width + width) * (height + -1.0)) bufferCount:a5];
  v14->_gLElementMeshSize.double width = width;
  v14->_gLElementMeshSize.double height = height;

  return v14;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [objc_alloc((Class)a1) initWithVertexAttributes:v8 vertexCount:a4 indexElementCount:a5 bufferCount:2];

  return v9;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 meshSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithVertexAttributes:v7 meshSize:2 bufferCount:width height];

  return v8;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 quadParticleCount:(unint64_t)a4
{
  unint64_t v6 = 4 * a4;
  unint64_t v7 = 6 * a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)a1) initWithVertexAttributes:v8 vertexCount:v6 indexElementCount:v7 bufferCount:2];

  if (v9) {
    v9[10] = a4;
  }
  return v9;
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  double v17 = a4.size.width;
  double v18 = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v11 = a3.size.height;
  double v12 = a3.size.width;
  double v13 = a3.origin.y;
  double v14 = a3.origin.x;
  id v15 = objc_alloc((Class)a1);

  return [v15 initWithVertexRect:width textureRect:height meshSize:1 textureFlipped:v14 includeCenterAttribute:v13 addTransparentBorder:x y:v17 v18];
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8
{
  BOOL v8 = a6;
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  double v19 = a4.size.width;
  double v20 = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v13 = a3.size.height;
  double v14 = a3.size.width;
  double v15 = a3.origin.y;
  double v16 = a3.origin.x;
  id v17 = objc_alloc((Class)a1);

  return [v17 initWithVertexRect:width textureRect:height meshSize:v8 textureFlipped:v16 includeCenterAttribute:v15 addTransparentBorder:x y:v19 v20];
}

+ (void)p_addTransparentBorderInsetToTextureRect:(CGRect *)a3 vertexRect:(CGRect *)a4
{
  if (a3)
  {
    if (a4) {
      goto LABEL_22;
    }
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D3238);
  }
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_1010748A4();
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D3258);
  }
  unint64_t v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10106590C(v6);
  }
  unint64_t v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLGPUDataBuffer p_addTransparentBorderInsetToTextureRect:vertexRect:]");
  BOOL v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 1097, 0, "invalid nil value for '%{public}s'", "textureRect");

  if (!a4)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3278);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010747F4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3298);
    }
    id v9 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v9);
    }
    id v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLGPUDataBuffer p_addTransparentBorderInsetToTextureRect:vertexRect:]");
    double v11 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1098, 0, "invalid nil value for '%{public}s'", "vertexRect");
  }
LABEL_22:
  double width = a3->size.width;
  if (width != 0.0)
  {
    double height = a3->size.height;
    if (height != 0.0)
    {
      double v14 = a4->size.width;
      if (v14 != 0.0)
      {
        double v15 = a4->size.height;
        if (v15 != 0.0)
        {
          double v16 = v14 / width;
          CGFloat x = a3->origin.x;
          CGFloat y = a3->origin.y;
          double v19 = v15 / height;
          if (CGRectGetMinX(*(CGRect *)(&width - 2)) == 0.0) {
            double v20 = -1.0;
          }
          else {
            double v20 = 0.0;
          }
          if (CGRectGetMaxX(*a3) == 1.0) {
            double v21 = 1.0;
          }
          else {
            double v21 = 0.0;
          }
          if (CGRectGetMinY(*a3) == 0.0) {
            double v22 = -1.0;
          }
          else {
            double v22 = 0.0;
          }
          CGRectGetMaxY(*a3);
          double v23 = v20 / v16 + CGRectGetMinX(*a3);
          double v24 = v22 / v19 + CGRectGetMinY(*a3);
          double v25 = v21 / v16 + CGRectGetMaxX(*a3);
          CGRectGetMaxY(*a3);
          double v26 = sub_100064044(v23, v24, v25);
          CGFloat v28 = v27;
          CGFloat v30 = v29;
          CGFloat v32 = v31;
          double v33 = CGRectGetMinX(*a4) + v20;
          double v34 = CGRectGetMinY(*a4) + v22;
          double v35 = CGRectGetMaxX(*a4) + v21;
          CGRectGetMaxY(*a4);
          double v36 = sub_100064044(v33, v34, v35);
          a3->origin.CGFloat x = v26;
          a3->origin.CGFloat y = v28;
          a3->size.double width = v30;
          a3->size.double height = v32;
          a4->origin.CGFloat x = v36;
          a4->origin.CGFloat y = v37;
          a4->size.double width = v38;
          a4->size.double height = v39;
        }
      }
    }
  }
}

- (CRLGPUDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8
{
  BOOL v8 = a6;
  int height_low = LODWORD(a5.height);
  int width_low = LODWORD(a5.width);
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGRect v42 = a3;
  CGRect v41 = a4;
  v46.origin.CGFloat x = CGRectZero.origin.x;
  v46.origin.CGFloat y = CGRectZero.origin.y;
  v46.size.CGFloat width = CGRectZero.size.width;
  v46.size.CGFloat height = CGRectZero.size.height;
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  BOOL v15 = CGRectEqualToRect(v45, v46);
  if (v8) {
    [objc_opt_class() p_addTransparentBorderInsetToTextureRect:&v41 vertexRect:&v42];
  }
  id v16 = objc_alloc_init((Class)NSMutableArray);
  id v17 = [[CRLGLDataBufferAttribute alloc] initWithName:@"Position" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
  [v16 addObject:v17];
  if (v15)
  {
    double v18 = 0;
  }
  else
  {
    double v18 = [[CRLGLDataBufferAttribute alloc] initWithName:@"TexCoord" bufferUsage:35044 dataType:3 normalized:1 componentCount:2];
    [v16 addObject:v18];
  }
  if (height_low)
  {
    double v19 = [[CRLGLDataBufferAttribute alloc] initWithName:@"Center" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
    [v16 addObject:v19];
  }
  else
  {
    double v19 = 0;
  }
  CGFloat v37 = v16;
  double v20 = -[CRLGPUDataBuffer initWithVertexAttributes:meshSize:bufferCount:](self, "initWithVertexAttributes:meshSize:bufferCount:", v16, 1, v43, v44);
  if (v20)
  {
    v20->_positionAttributeIndeCGFloat x = (unint64_t)[v16 indexOfObject:v17];
    if (!v15) {
      v20->_texCoordAttributeIndeCGFloat x = (unint64_t)[v16 indexOfObject:v18];
    }
    if (height_low) {
      v20->_centerAttributeIndeCGFloat x = (unint64_t)[v16 indexOfObject:v19];
    }
    double v21 = sub_100065738(v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
    uint64_t v22 = 0;
    unint64_t v23 = 0;
    float v24 = v21;
    unint64_t v38 = (unint64_t)(v44 + -1.0);
    float v26 = v25;
    double v27 = (double)(unint64_t)(v43 + -1.0);
    do
    {
      unint64_t v28 = 0;
      unint64_t v39 = v23;
      double v29 = (double)v23 / (double)v38;
      do
      {
        double v30 = sub_100066AB8((double)v28 / v27, v29, v42.origin.x, v42.origin.y, v42.size.width);
        *(float *)&double v30 = v30;
        *(float *)&double v31 = v31;
        -[CRLGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v20, "setGLPoint2D:forAttribute:atIndex:", v17, v22 + v28, v30, v31);
        if (!v15)
        {
          double v34 = sub_100066AB8((double)v28 / v27, v29, v41.origin.x, v41.origin.y, v41.size.width);
          *(float *)&double v34 = v34;
          *(float *)&double v35 = v35;
          if (width_low) {
            *(float *)&double v35 = 1.0 - *(float *)&v35;
          }
          -[CRLGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v20, "setGLPoint2D:forAttribute:atIndex:", v18, v22 + v28, v34, v35);
        }
        if (height_low)
        {
          *(float *)&double v32 = v24;
          *(float *)&double v33 = v26;
          -[CRLGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v20, "setGLPoint2D:forAttribute:atIndex:", v19, v22 + v28, v32, v33);
        }
        ++v28;
      }
      while (v28 <= (unint64_t)(v43 + -1.0));
      unint64_t v23 = v39 + 1;
      v22 += v28;
    }
    while (v39 + 1 <= v38);
  }

  return v20;
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:", *(void *)&a5.width, 0, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:", 1, *(void *)&a5.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 textureFlipped:(BOOL)a5
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

- (void)enableDataBuffer
{
  if (self->_device)
  {
    self->_conformsToMetalProtocol = 1;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v3 = self->_arrayBuffers;
    id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) enableArrayBufferWithDevice:self->_device v14];
        }
        id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }

    if (!self->_metalElementData && self->_elementArrayCount)
    {
      [(CRLGPUDataBuffer *)self p_setupElementArrayBufferIfNecessary];
      BOOL v8 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:self->_gLElementData length:2 * self->_elementArrayCount options:0];
      metalElementData = self->_metalElementData;
      self->_metalElementData = v8;

      gLElementData = self->_gLElementData;
      if (gLElementData)
      {
        free(gLElementData);
        self->_gLElementData = 0;
      }
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D32B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101074954();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D32D8);
    }
    double v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    double v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer enableDataBuffer]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:1233 isFatal:0 description:"Can't initialize metal buffers without a device!"];
  }
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5 device:(id)a6
{
  id v11 = a6;
  id v12 = a3;
  double v13 = (id *)[objc_alloc((Class)a1) initWithVertexAttributes:v12 vertexCount:a4 indexElementCount:a5 bufferCount:3];

  if (v13) {
    objc_storeStrong(v13 + 12, a6);
  }

  return v13;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 meshSize:(CGSize)a4 device:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  id v9 = a5;
  if (width <= 1.0 || height <= 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D32F8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010749DC();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3318);
    }
    id v11 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v11);
    }
    id v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:]");
    double v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v12 file:v13 lineNumber:1261 isFatal:0 description:"Mesh size is not at least 2x2!"];
  }
  long long v14 = +[CRLGPUDataBuffer newDataBufferWithVertexAttributes:v8 vertexCount:(unint64_t)(width * height) indexElementCount:(unint64_t)((width + width) * (height + -1.0)) device:v9];
  long long v15 = v14;
  if (v14)
  {
    v14[8] = width;
    v14[9] = height;
  }

  return v15;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 quadParticleCount:(unint64_t)a4 device:(id)a5
{
  id result = +[CRLGPUDataBuffer newDataBufferWithVertexAttributes:a3 vertexCount:4 * a4 indexElementCount:6 * a4 device:a5];
  if (result) {
    *((void *)result + 10) = a4;
  }
  return result;
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 device:(id)a5
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:device:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 textureFlipped:(BOOL)a5 device:(id)a6
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:", a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 device:(id)a6
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:", 1, *(void *)&a5.width, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 device:(id)a7
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:device:", *(void *)&a5.width, 0, *(void *)&a5.height, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 device:(id)a8
{
  return +[CRLGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:device:](CRLGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:device:", *(void *)&a5.width, *(void *)&a5.height, 1, a6, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8 device:(id)a9
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  double v24 = a4.size.width;
  double v25 = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v15 = a3.size.height;
  double v16 = a3.size.width;
  double v17 = a3.origin.y;
  double v18 = a3.origin.x;
  id v20 = (id)a7;
  double v21 = [(id *)objc_alloc((Class)a1) initWithVertexRect:*(void *)&width textureRect:*(void *)&height meshSize:v10 textureFlipped:v18 includeCenterAttribute:v17 addTransparentBorder:x, y, v24, v25, v26, v27];
  uint64_t v22 = v21;
  if (v21) {
    objc_storeStrong(v21 + 12, (id)v9);
  }

  return v22;
}

- (void)teardown
{
  if (self->_didTeardown) {
    return;
  }
  vertexAttributes = self->_vertexAttributes;
  self->_vertexAttributes = 0;

  arrayBuffers = self->_arrayBuffers;
  self->_arrayBuffers = 0;

  attributeToArrayBuffersDictionardouble y = self->_attributeToArrayBuffersDictionary;
  self->_attributeToArrayBuffersDictionardouble y = 0;

  gLElementData = self->_gLElementData;
  if (gLElementData)
  {
    free(gLElementData);
    self->_gLElementData = 0;
  }
  if (self->_gLElementDataBuffer) {
    glDeleteBuffers(1, &self->_gLElementDataBuffer);
  }
  gLVertexArrayObjects = self->_gLVertexArrayObjects;
  if (self->_gLVertexArrayObjects[1])
  {
    GLsizei v8 = 2;
LABEL_10:
    glDeleteVertexArrays(v8, gLVertexArrayObjects);
    goto LABEL_11;
  }
  if (*gLVertexArrayObjects)
  {
    GLsizei v8 = 1;
    goto LABEL_10;
  }
LABEL_11:
  metalElementData = self->_metalElementData;
  if (metalElementData)
  {
    self->_metalElementData = 0;
  }
  self->_didTeardown = 1;
}

- (void)dealloc
{
  [(CRLGPUDataBuffer *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)CRLGPUDataBuffer;
  [(CRLGPUDataBuffer *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = +[NSMutableArray array];
  id v4 = +[NSString stringWithFormat:@"vertexCount:%ld", [(CRLGPUDataBuffer *)self vertexCount]];
  [v3 addObject:v4];

  id v5 = +[NSString stringWithFormat:@"elementArrayCount:%ld", self->_elementArrayCount];
  [v3 addObject:v5];

  unint64_t elementArrayCount = self->_elementArrayCount;
  if (elementArrayCount)
  {
    unint64_t v7 = 2 * elementArrayCount;
    if (2 * elementArrayCount <= 0x100000)
    {
      if (v7 < 0x401)
      {
        BOOL v10 = 0;
        goto LABEL_8;
      }
      CFStringRef v8 = @"(%0.1fKB)";
      double v9 = 0.0009765625;
    }
    else
    {
      CFStringRef v8 = @"(%0.1fMB)";
      double v9 = 0.000000953674316;
    }
    BOOL v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v9 * (double)v7);
LABEL_8:
    id v11 = +[NSString stringWithFormat:@"elementBufferSize:%ldB%@", v7, v10];
    [v3 addObject:v11];
  }
  id v12 = +[NSString stringWithFormat:@"arrayBuffers:%@", self->_arrayBuffers];
  [v3 addObject:v12];

  if (self->_conformsToMetalProtocol)
  {
    unint64_t v13 = [(CRLGPUDataBuffer *)self metalDrawMode];
    if (v13 < 5)
    {
      long long v14 = &off_1014D3428[v13];
LABEL_14:
      CFStringRef v16 = *v14;
      goto LABEL_17;
    }
    CFStringRef v16 = @"Unknown";
  }
  else
  {
    unsigned int v15 = [(CRLGPUDataBuffer *)self drawMode];
    if (v15 < 7)
    {
      long long v14 = &off_1014D3450[v15];
      goto LABEL_14;
    }
    CFStringRef v16 = @"UNKNOWN";
  }
LABEL_17:
  double v17 = +[NSString stringWithFormat:@"drawMode:%@", v16];
  [v3 addObject:v17];

  v22.receiver = self;
  v22.super_class = (Class)CRLGPUDataBuffer;
  double v18 = [(CRLGPUDataBuffer *)&v22 description];
  double v19 = [v3 componentsJoinedByString:@","];
  id v20 = +[NSString stringWithFormat:@"%@: {%@}", v18, v19];

  return (NSString *)v20;
}

- (void)setDrawMode:(unsigned int)a3
{
  self->_drawMode = a3;
}

- (unsigned)GLushortForIndexElement:(unint64_t)a3
{
  return self->_gLElementData[a3];
}

- (void)setGLushort:(unsigned __int16)a3 forIndexElement:(unint64_t)a4
{
  self->_gLElementData[a4] = a3;
}

- (void)enableGLElementArrayBuffer
{
  [(CRLGPUDataBuffer *)self p_setupGLElementArrayBufferIfNecessary];
  if (self->_gLElementDataBufferWasSetup)
  {
    GLuint gLElementDataBuffer = self->_gLElementDataBuffer;
    glBindBuffer(0x8893u, gLElementDataBuffer);
  }
}

- (void)disableGLElementArrayBuffer
{
  if (self->_gLElementDataBufferWasSetup) {
    glBindBuffer(0x8893u, 0);
  }
}

- (void)setMetalDrawMode:(unint64_t)a3
{
  self->_metalDrawMode = a3;
}

- (void)disableWithDevice:(id)a3
{
  metalElementData = self->_metalElementData;
  self->_metalElementData = 0;
}

- (void)encodeWithEncoder:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v7 = self->_arrayBuffers;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) encodeArrayBufferWithEncoder:v6 atIndex:(char *)v11 + a4];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      a4 += (unint64_t)v11;
    }
    while (v9);
  }
}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 range:(_NSRange)a5
{
}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 range:(_NSRange)a5 advanceDynamicBuffer:(BOOL)a6
{
  BOOL v6 = a6;
  int length = a5.length;
  NSUInteger location = a5.location;
  id v11 = a3;
  [(CRLGPUDataBuffer *)self enableDataBuffer];
  if (!self->_conformsToMetalProtocol)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3338);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101074A64();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D3358);
    }
    long long v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v12);
    }
    long long v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:]");
    long long v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:1502 isFatal:0 description:"Can only be called on a buffer that conforms to metal protocol!"];
  }
  [(CRLGPUDataBuffer *)self encodeWithEncoder:v11 atIndex:a4];
  if (self->_gLElementDataBufferWasSetup && self->_elementArrayCount)
  {
    double height = self->_gLElementMeshSize.height;
    if (self->_gLElementMeshSize.width == CGSizeZero.width && height == CGSizeZero.height)
    {
      [v11 drawIndexedPrimitives:[self metalDrawMode] indexCount:length indexType:0 indexBuffer:self->_metalElementData indexBufferOffset:2 * location];
    }
    else if (height + -1.0 > 0.0)
    {
      unint64_t v17 = 0;
      uint64_t v18 = 1;
      do
      {
        [v11 drawIndexedPrimitives:[self metalDrawMode] indexCount:(self->_gLElementMeshSize.width + self->_gLElementMeshSize.width) indexType:0 indexBuffer:self->_metalElementData indexBufferOffset:(self->_gLElementMeshSize.width * (double)v17 + self->_gLElementMeshSize.width * (double)v17)];
        CGFloat v19 = (double)v18++;
        v17 += 2;
      }
      while (self->_gLElementMeshSize.height + -1.0 > v19);
    }
  }
  else
  {
    [v11 drawPrimitives:[self metalDrawMode] vertexStart:location vertexCount:length];
  }
  if ([(CRLGPUDataBuffer *)self isDynamicallyBuffered] && v6)
  {
    arrayBuffers = self->_arrayBuffers;
    self->_currentBufferIndedouble x = (self->_currentBufferIndex + 1) % 3;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v21 = arrayBuffers;
    id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v26 bufferCount] != (id)1) {
            [v26 setCurrentBufferIndex:self->_currentBufferIndex];
          }
        }
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v23);
    }
  }
}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t elementArrayCount = self->_elementArrayCount;
  if (!elementArrayCount) {
    unint64_t elementArrayCount = self->_vertexCount;
  }
  -[CRLGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:](self, "drawWithEncoder:atIndex:range:advanceDynamicBuffer:", a3, a4, 0, elementArrayCount, 1);
}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 advanceDynamicBuffer:(BOOL)a5
{
  unint64_t elementArrayCount = self->_elementArrayCount;
  if (!elementArrayCount) {
    unint64_t elementArrayCount = self->_vertexCount;
  }
  -[CRLGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:](self, "drawWithEncoder:atIndex:range:advanceDynamicBuffer:", a3, a4, 0, elementArrayCount, a5);
}

- (float)GLfloatForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 dataArrayBuffer];
  [v6 GLfloatForAttribute:v5 atIndex:a4];
  float v8 = v7;

  return v8;
}

- (void)setGLfloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  id v9 = [v7 dataArrayBuffer];
  *(float *)&double v8 = a3;
  [v9 setGLfloat:v7 forAttribute:a5 atIndex:v8];
}

- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  *(float *)&a3 = a3;
  [(CRLGPUDataBuffer *)self setGLfloat:a4 forAttribute:a5 atIndex:a3];
}

- ($94F468A8D4C62B317260615823C2B210)GLPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 dataArrayBuffer];
  [v6 GLPoint2DForAttribute:v5 atIndex:a4];
  float v8 = v7;
  float v10 = v9;

  float v11 = v8;
  float v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)setGLPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v8 = a4;
  id v11 = [v8 dataArrayBuffer];
  *(float *)&double v9 = var0;
  *(float *)&double v10 = var1;
  [v11 setGLPoint2D:v8 forAttribute:a5 atIndex:v9];
}

- ($E2C29196C7A5C696474C6955C5A9CE06)GLPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 dataArrayBuffer];
  [v6 GLPoint3DForAttribute:v5 atIndex:a4];
  float v8 = v7;
  float v10 = v9;
  float v12 = v11;

  float v13 = v8;
  float v14 = v10;
  float v15 = v12;
  result.var2 = v15;
  result.float var1 = v14;
  result.float var0 = v13;
  return result;
}

- (void)setGLPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v9 = a4;
  id v13 = [v9 dataArrayBuffer];
  *(float *)&double v10 = var0;
  *(float *)&double v11 = var1;
  *(float *)&double v12 = var2;
  [v13 setGLPoint3D:v9 forAttribute:a5 atIndex:v10 v11, v12];
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)GLPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 dataArrayBuffer];
  [v6 GLPoint4DForAttribute:v5 atIndex:a4];
  float v8 = v7;
  float v10 = v9;
  float v12 = v11;
  float v14 = v13;

  float v15 = v8;
  float v16 = v10;
  float v17 = v12;
  float v18 = v14;
  result.var3 = v18;
  result.float var2 = v17;
  result.float var1 = v16;
  result.float var0 = v15;
  return result;
}

- (void)setGLPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var3 = a3.var3;
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v10 = a4;
  id v15 = [v10 dataArrayBuffer];
  *(float *)&double v11 = var0;
  *(float *)&double v12 = var1;
  *(float *)&double v13 = var2;
  *(float *)&double v14 = var3;
  [v15 setGLPoint4D:v10 forAttribute:a5 atIndex:v11 v12 v13 v14];
}

- (void)setDataForAttribute:(id)a3 atIndex:(unint64_t)a4 fromAttribute:(id)a5 dataBuffer:(id)a6 index:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  switch([v12 componentCount])
  {
    case 1u:
      [v14 GLfloatForAttribute:v13 atIndex:a7];
      -[CRLGPUDataBuffer setGLfloat:forAttribute:atIndex:](self, "setGLfloat:forAttribute:atIndex:", v12, a4);
      break;
    case 2u:
      [v14 GLPoint2DForAttribute:v13 atIndex:a7];
      -[CRLGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](self, "setGLPoint2D:forAttribute:atIndex:", v12, a4);
      break;
    case 3u:
      [v14 GLPoint3DForAttribute:v13 atIndex:a7];
      -[CRLGPUDataBuffer setGLPoint3D:forAttribute:atIndex:](self, "setGLPoint3D:forAttribute:atIndex:", v12, a4);
      break;
    case 4u:
      [v14 GLPoint4DForAttribute:v13 atIndex:a7];
      -[CRLGPUDataBuffer setGLPoint4D:forAttribute:atIndex:](self, "setGLPoint4D:forAttribute:atIndex:", v12, a4);
      break;
    default:
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3378);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101074AEC();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014D3398);
      }
      id v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v15);
      }
      float v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer setDataForAttribute:atIndex:fromAttribute:dataBuffer:index:]");
      float v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
      +[CRLAssertionHandler handleFailureInFunction:v16 file:v17 lineNumber:1626 isFatal:0 description:"Unknown attribute size!"];

      break;
  }
}

- (id)vertexAttributeNamed:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(CRLGPUDataBuffer *)self vertexAttributes];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        float v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 name];
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)updateDataBufferAttributesWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLGPUDataBuffer *)self vertexAttributes];
  [(CRLGPUDataBuffer *)self updateMetalDataBufferAttributes:v5 withBlock:v4];
}

- (void)updateMetalDataBufferAttributes:(id)a3 withBlock:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void *, id))a4;
  if (v13 && [v13 count])
  {
    self->_isUpdatingRawDataBuffer = 1;
    uint64_t v7 = (char *)[v13 count];
    float v8 = (char *)malloc_type_calloc(0x58uLL, (size_t)v7, 0x6992B64DuLL);
    float v9 = v8;
    if (v7)
    {
      id v10 = 0;
      unsigned __int8 v11 = v8;
      do
      {
        id v12 = [v13 objectAtIndex:v10];
        [(CRLGPUDataBuffer *)self p_setAttributeUpdateData:v11 fromAttribute:v12];

        ++v10;
        v11 += 88;
      }
      while (v7 != v10);
    }
    v6[2](v6, v9, v7);
    self->_isUpdatingRawDataBuffer = 0;
    free(v9);
  }
}

- (void)updateDataBufferAttributes:(id)a3 withBlock:(id)a4
{
  id v19 = a3;
  id v6 = (void (**)(id, void *, id))a4;
  if (v19 && [v19 count])
  {
    self->_isUpdatingRawDataBuffer = 1;
    uint64_t v7 = (char *)[v19 count];
    float v8 = (uint64_t *)malloc_type_calloc(0x58uLL, (size_t)v7, 0x19C1D01uLL);
    float v9 = v8;
    if (v7)
    {
      id v10 = 0;
      unsigned __int8 v11 = (char *)v8;
      do
      {
        id v12 = [v19 objectAtIndex:v10];
        [(CRLGPUDataBuffer *)self p_setAttributeUpdateData:v11 fromAttribute:v12];

        ++v10;
        v11 += 88;
      }
      while (v7 != v10);
      v6[2](v6, v9, v7);
      self->_isUpdatingRawDataBuffer = 0;
      id v13 = 0;
      long long v14 = v9 + 9;
      do
      {
        if (*(unsigned char *)(v14 - 2))
        {
          uint64_t v16 = *(v14 - 1);
          uint64_t v15 = *v14;
          float v17 = [v19 objectAtIndex:v13];
          float v18 = [v17 dataArrayBuffer];
          [v18 addIndexRangeNeedsUpdate:v16, v15];
        }
        ++v13;
        v14 += 11;
      }
      while (v7 != v13);
    }
    else
    {
      v6[2](v6, v8, 0);
      self->_isUpdatingRawDataBuffer = 0;
    }
    free(v9);
  }
}

- (BOOL)p_setAttributeUpdateData:(id *)a3 fromAttribute:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  BOOL isUpdatingRawDataBuffer = self->_isUpdatingRawDataBuffer;
  if (self->_isUpdatingRawDataBuffer)
  {
    float v9 = [v6 dataArrayBuffer];
    a3->float var3 = (char *)[v9 dataPointer];

    a3->float var0 = (int64_t)[v7 dataType];
    a3->float var1 = (int)[v7 componentCount];
    a3->float var2 = [v7 isNormalized];
    a3->var4 = (unint64_t)[v7 bufferOffset];
    id v10 = [v7 dataArrayBuffer];
    a3->var5 = (unint64_t)[v10 dataBufferEntrySize];

    unsigned __int8 v11 = [v7 dataArrayBuffer];
    a3->NSUInteger var6 = (unint64_t)[v11 vertexCount];

    a3->var7 = 1;
    NSUInteger var6 = a3->var6;
    a3->var8.NSUInteger location = 0;
    a3->var8.int length = var6;
    a3->var9 = sub_1000BECA8((uint64_t)[v7 dataType]);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D33B8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101074B74();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014D33D8);
    }
    id v13 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v13);
    }
    long long v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGPUDataBuffer p_setAttributeUpdateData:fromAttribute:]");
    uint64_t v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLGLDataBuffer.m"];
    +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:1703 isFatal:0 description:"Can only be called from within update block!"];
  }
  return isUpdatingRawDataBuffer;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- (NSArray)vertexAttributes
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (unsigned)drawMode
{
  return self->_drawMode;
}

- (BOOL)isDynamicallyBuffered
{
  return self->_isDynamicallyBuffered;
}

- (unint64_t)metalDrawMode
{
  return self->_metalDrawMode;
}

- (unint64_t)positionAttributeIndex
{
  return self->_positionAttributeIndex;
}

- (unint64_t)texCoordAttributeIndex
{
  return self->_texCoordAttributeIndex;
}

- (unint64_t)centerAttributeIndex
{
  return self->_centerAttributeIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vertexAttributes, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_metalElementData, 0);
  objc_storeStrong((id *)&self->_attributeToArrayBuffersDictionary, 0);

  objc_storeStrong((id *)&self->_arrayBuffers, 0);
}

@end