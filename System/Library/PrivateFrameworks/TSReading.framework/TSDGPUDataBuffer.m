@interface TSDGPUDataBuffer
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
- ($94F468A8D4C62B317260615823C2B210)metalPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)GLPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)metalPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- ($E2C29196C7A5C696474C6955C5A9CE06)GLPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)isDynamicallyBuffered;
- (BOOL)p_setAttributeUpdateData:(id *)a3 fromAttribute:(id)a4;
- (NSArray)vertexAttributes;
- (NSString)description;
- (TSDGPUDataBuffer)initWithVertexAttributes:(id)a3 meshSize:(CGSize)a4 bufferCount:(unint64_t)a5;
- (TSDGPUDataBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5 bufferCount:(unint64_t)a6;
- (TSDGPUDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7;
- (TSDGPUDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8;
- (float)metalFloatForAttribute:(id)a3 atIndex:(unint64_t)a4;
- (id)vertexAttributeNamed:(id)a3;
- (unint64_t)centerAttributeIndex;
- (unint64_t)metalDrawMode;
- (unint64_t)positionAttributeIndex;
- (unint64_t)texCoordAttributeIndex;
- (unint64_t)vertexCount;
- (unsigned)drawMode;
- (void)dealloc;
- (void)disableWithDevice:(id)a3;
- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4;
- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 advanceDynamicBuffer:(BOOL)a5;
- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 range:(_NSRange)a5;
- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 range:(_NSRange)a5 advanceDynamicBuffer:(BOOL)a6;
- (void)enableDataBuffer;
- (void)encodeWithEncoder:(id)a3 atIndex:(unint64_t)a4;
- (void)p_setupElementArrayBufferIfNecessary;
- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setDataForAttribute:(id)a3 atIndex:(unint64_t)a4 fromAttribute:(id)a5 dataBuffer:(id)a6 index:(unint64_t)a7;
- (void)setDrawMode:(unsigned int)a3;
- (void)setGLPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setGLPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setGLPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setGLushort:(unsigned __int16)a3 forIndexElement:(unint64_t)a4;
- (void)setMetalDrawMode:(unint64_t)a3;
- (void)setMetalFloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setMetalPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setMetalPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)setMetalPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5;
- (void)teardown;
- (void)updateDataBufferAttributes:(id)a3 withBlock:(id)a4;
- (void)updateDataBufferAttributesWithBlock:(id)a3;
- (void)updateMetalDataBufferAttributes:(id)a3 withBlock:(id)a4;
@end

@implementation TSDGPUDataBuffer

- (void)p_setupElementArrayBufferIfNecessary
{
  if (!self->_gLElementDataBufferWasSetup)
  {
    if (self->_gLElementData)
    {
      double width = self->_gLElementMeshSize.width;
      double height = self->_gLElementMeshSize.height;
      if (width != *MEMORY[0x263F001B0] || height != *(double *)(MEMORY[0x263F001B0] + 8))
      {
        if (height + -1.0 > 0.0)
        {
          unint64_t v6 = 0;
          uint64_t v7 = 0;
          double v8 = 0.0;
          do
          {
            double v9 = (double)++v6;
            if (width > 0.0)
            {
              double v10 = 0.0;
              unint64_t v11 = 1;
              do
              {
                uint64_t v12 = v7 + 1;
                [(TSDGPUDataBuffer *)self setGLushort:(int)(v10 + v8 * width) forIndexElement:v7];
                v7 += 2;
                [(TSDGPUDataBuffer *)self setGLushort:(int)(v10 + v9 * self->_gLElementMeshSize.width) forIndexElement:v12];
                double v10 = (double)v11;
                double width = self->_gLElementMeshSize.width;
                ++v11;
              }
              while (width > v10);
              double height = self->_gLElementMeshSize.height;
            }
            double v8 = (double)v6;
          }
          while (height + -1.0 > v9);
          goto LABEL_21;
        }
        goto LABEL_20;
      }
      if (self->_gLElementQuadParticleCount)
      {
        [(TSDGPUDataBuffer *)self setMetalDrawMode:3];
        if (self->_gLElementQuadParticleCount)
        {
          unint64_t v13 = 0;
          uint64_t v14 = 0;
          do
          {
            [(TSDGPUDataBuffer *)self setGLushort:4 * (v13 & 0x3FFF) forIndexElement:v14];
            [(TSDGPUDataBuffer *)self setGLushort:(unsigned __int16)(4 * v13) | 1u forIndexElement:v14 + 1];
            [(TSDGPUDataBuffer *)self setGLushort:(4 * v13) & 0xFFFC | 2u forIndexElement:v14 + 2];
            [(TSDGPUDataBuffer *)self setGLushort:4 * (v13 & 0x3FFF) forIndexElement:v14 + 3];
            [(TSDGPUDataBuffer *)self setGLushort:(4 * v13) & 0xFFFC | 2u forIndexElement:v14 + 4];
            uint64_t v7 = v14 + 6;
            [(TSDGPUDataBuffer *)self setGLushort:(unsigned __int16)(4 * v13++) | 3u forIndexElement:v14 + 5];
            v14 += 6;
          }
          while (v13 < self->_gLElementQuadParticleCount);
          goto LABEL_21;
        }
LABEL_20:
        uint64_t v7 = 0;
LABEL_21:
        if (v7 != self->_elementArrayCount)
        {
          v15 = [MEMORY[0x263F7C7F0] currentHandler];
          v16 = [NSString stringWithUTF8String:"-[TSDGPUDataBuffer p_setupElementArrayBufferIfNecessary]"];
          v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
          [v15 handleFailureInFunction:v16 file:v17 lineNumber:796 description:@"Element array count Sanity check"];
        }
      }
    }
    self->_gLElementDataBufferWasSetup = 1;
  }
}

- (TSDGPUDataBuffer)initWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5 bufferCount:(unint64_t)a6
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v10 = a3;
  unint64_t v49 = a4;
  if (a4 < 0xFFFF)
  {
    v60.receiver = self;
    v60.super_class = (Class)TSDGPUDataBuffer;
    v15 = [(TSDGPUDataBuffer *)&v60 init];
    v16 = v15;
    if (v15)
    {
      unint64_t count = a5;
      [(TSDGPUDataBuffer *)v15 setDrawMode:5];
      [(TSDGPUDataBuffer *)v16 setMetalDrawMode:4];
      uint64_t v17 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:v10];
      vertexAttributes = v16->_vertexAttributes;
      v16->_vertexAttributes = (NSArray *)v17;

      v16->_vertexCount = a4;
      v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      arrayBuffers = v16->_arrayBuffers;
      v16->_arrayBuffers = v19;

      uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", -[NSArray count](v16->_vertexAttributes, "count"));
      attributeToArrayBuffersDictionary = v16->_attributeToArrayBuffersDictionary;
      v16->_attributeToArrayBuffersDictionary = (NSMutableDictionary *)v21;

      v16->_isDynamicallyBuffered = 1;
      id v47 = v10;
      v48 = [MEMORY[0x263EFF980] arrayWithArray:v10];
      if ([v48 count])
      {
        unint64_t v23 = a6;
        do
        {
          v24 = [v48 objectAtIndex:0];
          v25 = [MEMORY[0x263EFF980] array];
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v26 = v48;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v56 objects:v62 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v57;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v57 != v29) {
                  objc_enumerationMutation(v26);
                }
                v31 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                int v32 = [v31 bufferUsage];
                if (v32 == [v24 bufferUsage]) {
                  [v25 addObject:v31];
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v56 objects:v62 count:16];
            }
            while (v28);
          }

          if ([v24 bufferUsage] == 35044)
          {
            v16->_isDynamicallyBuffered = 0;
            unint64_t v23 = 1;
          }
          v33 = [[TSDGPUDataArrayBuffer alloc] initWithVertexAttributes:v25 vertexCount:v49 bufferCount:v23];
          if (v33)
          {
            v50 = v25;
            unint64_t v51 = v23;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v34 = v25;
            uint64_t v35 = [v34 countByEnumeratingWithState:&v52 objects:v61 count:16];
            if (v35)
            {
              uint64_t v36 = v35;
              uint64_t v37 = *(void *)v53;
              do
              {
                for (uint64_t j = 0; j != v36; ++j)
                {
                  if (*(void *)v53 != v37) {
                    objc_enumerationMutation(v34);
                  }
                  v39 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                  [v39 setDataBuffer:v16];
                  v40 = v16->_attributeToArrayBuffersDictionary;
                  v41 = [v39 name];
                  [(NSMutableDictionary *)v40 setObject:v33 forKey:v41];
                }
                uint64_t v36 = [v34 countByEnumeratingWithState:&v52 objects:v61 count:16];
              }
              while (v36);
            }

            [(NSMutableArray *)v16->_arrayBuffers addObject:v33];
            v25 = v50;
            unint64_t v23 = v51;
          }
          else
          {
            v42 = [MEMORY[0x263F7C7F0] currentHandler];
            v43 = [NSString stringWithUTF8String:"-[TSDGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:]"];
            v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
            [v42 handleFailureInFunction:v43 file:v44 lineNumber:844 description:@"Error creating array buffer!"];
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

      id v10 = v47;
    }
    self = v16;
    uint64_t v14 = self;
  }
  else
  {
    unint64_t v11 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDGPUDataBuffer initWithVertexAttributes:vertexCount:indexElementCount:bufferCount:]"];
    unint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
    [v11 handleFailureInFunction:v12 file:v13 lineNumber:807 description:@"Too many vertices!"];

    uint64_t v14 = 0;
  }

  return v14;
}

- (TSDGPUDataBuffer)initWithVertexAttributes:(id)a3 meshSize:(CGSize)a4 bufferCount:(unint64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  if (width <= 1.0 || height <= 1.0)
  {
    unint64_t v11 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDGPUDataBuffer initWithVertexAttributes:meshSize:bufferCount:]"];
    unint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
    [v11 handleFailureInFunction:v12 file:v13 lineNumber:866 description:@"Mesh size is not at least 2x2!"];
  }
  uint64_t v14 = [(TSDGPUDataBuffer *)self initWithVertexAttributes:v9 vertexCount:(unint64_t)(width * height) indexElementCount:(unint64_t)((width + width) * (height + -1.0)) bufferCount:a5];
  v14->_gLElementMeshSize.double width = width;
  v14->_gLElementMeshSize.double height = height;

  return v14;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5
{
  id v8 = a3;
  id v9 = (void *)[objc_alloc((Class)a1) initWithVertexAttributes:v8 vertexCount:a4 indexElementCount:a5 bufferCount:2];

  return v9;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 meshSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = objc_msgSend(objc_alloc((Class)a1), "initWithVertexAttributes:meshSize:bufferCount:", v7, 2, width, height);

  return v8;
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 quadParticleCount:(unint64_t)a4
{
  unint64_t v6 = 4 * a4;
  unint64_t v7 = 6 * a4;
  id v8 = a3;
  id v9 = (void *)[objc_alloc((Class)a1) initWithVertexAttributes:v8 vertexCount:v6 indexElementCount:v7 bufferCount:2];

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

  return (id)objc_msgSend(v15, "initWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:", *(void *)&width, *(void *)&height, v14, v13, v12, v11, x, y, v17, v18);
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

  return (id)objc_msgSend(v17, "initWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:", *(void *)&width, *(void *)&height, v8, v16, v15, v14, v13, x, y, v19, v20);
}

+ (void)p_addTransparentBorderInsetToTextureRect:(CGRect *)a3 vertexRect:(CGRect *)a4
{
  if (!a3)
  {
    id v34 = [MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v35 = [NSString stringWithUTF8String:"+[TSDGPUDataBuffer p_addTransparentBorderInsetToTextureRect:vertexRect:]"];
    uint64_t v36 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, v36, 918, @"invalid nil value for '%s'", "textureRect");

    if (a4) {
      goto LABEL_3;
    }
LABEL_19:
    uint64_t v37 = [MEMORY[0x263F7C7F0] currentHandler];
    v38 = [NSString stringWithUTF8String:"+[TSDGPUDataBuffer p_addTransparentBorderInsetToTextureRect:vertexRect:]"];
    v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
    objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, v39, 919, @"invalid nil value for '%s'", "vertexRect");

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_19;
  }
LABEL_3:
  double width = a3->size.width;
  if (width != 0.0)
  {
    double height = a3->size.height;
    if (height != 0.0)
    {
      double v8 = a4->size.width;
      if (v8 != 0.0)
      {
        double v9 = a4->size.height;
        if (v9 != 0.0)
        {
          double v10 = v8 / width;
          CGFloat x = a3->origin.x;
          CGFloat y = a3->origin.y;
          double v13 = v9 / height;
          if (CGRectGetMinX(*(CGRect *)(&width - 2)) == 0.0) {
            double v14 = -1.0;
          }
          else {
            double v14 = 0.0;
          }
          if (CGRectGetMaxX(*a3) == 1.0) {
            double v15 = 1.0;
          }
          else {
            double v15 = 0.0;
          }
          if (CGRectGetMinY(*a3) == 0.0) {
            double v16 = -1.0;
          }
          else {
            double v16 = 0.0;
          }
          CGRectGetMaxY(*a3);
          double v17 = v14 / v10 + CGRectGetMinX(*a3);
          double v18 = v16 / v13 + CGRectGetMinY(*a3);
          double v19 = v15 / v10 + CGRectGetMaxX(*a3);
          CGRectGetMaxY(*a3);
          double v20 = TSDRectWithPoints(v17, v18, v19);
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          double v27 = CGRectGetMinX(*a4) + v14;
          double v28 = CGRectGetMinY(*a4) + v16;
          double v29 = CGRectGetMaxX(*a4) + v15;
          CGRectGetMaxY(*a4);
          double v30 = TSDRectWithPoints(v27, v28, v29);
          a3->origin.CGFloat x = v20;
          a3->origin.CGFloat y = v22;
          a3->size.double width = v24;
          a3->size.double height = v26;
          a4->origin.CGFloat x = v30;
          a4->origin.CGFloat y = v31;
          a4->size.double width = v32;
          a4->size.double height = v33;
        }
      }
    }
  }
}

- (TSDGPUDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7
{
  int height_low = LODWORD(a5.height);
  int width_low = LODWORD(a5.width);
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v37 = a4.origin.x;
  double v38 = a4.origin.y;
  double v39 = a4.size.width;
  BOOL v12 = CGRectEqualToRect(a4, *MEMORY[0x263F001A8]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  double v14 = [[TSDGPUDataBufferAttribute alloc] initWithName:@"Position" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
  [v13 addObject:v14];
  if (v12)
  {
    double v15 = 0;
  }
  else
  {
    double v15 = [[TSDGPUDataBufferAttribute alloc] initWithName:@"TexCoord" bufferUsage:35044 dataType:3 normalized:1 componentCount:2];
    [v13 addObject:v15];
  }
  if (height_low)
  {
    double v16 = [[TSDGPUDataBufferAttribute alloc] initWithName:@"Center" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
    [v13 addObject:v16];
  }
  else
  {
    double v16 = 0;
  }
  double v17 = -[TSDGPUDataBuffer initWithVertexAttributes:meshSize:bufferCount:](self, "initWithVertexAttributes:meshSize:bufferCount:", v13, 1, v42, v43, v13);
  if (v17)
  {
    v17->_positionAttributeIndeCGFloat x = [v34 indexOfObject:v14];
    if (!v12) {
      v17->_texCoordAttributeIndeCGFloat x = [v34 indexOfObject:v15];
    }
    if (height_low) {
      v17->_centerAttributeIndeCGFloat x = [v34 indexOfObject:v16];
    }
    double v18 = TSDCenterOfRect(x, y, width, height);
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    float v21 = v18;
    unint64_t v35 = (unint64_t)(v43 + -1.0);
    float v23 = v22;
    double v24 = (double)(unint64_t)(v42 + -1.0);
    do
    {
      unint64_t v25 = 0;
      unint64_t v36 = v20;
      double v26 = (double)v20 / (double)v35;
      do
      {
        double v27 = TSDPointFromNormalizedRect((double)v25 / v24, v26, x, y, width);
        *(float *)&double v27 = v27;
        *(float *)&double v28 = v28;
        -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v17, "setGLPoint2D:forAttribute:atIndex:", v14, v19 + v25, v27, v28);
        if (!v12)
        {
          double v31 = TSDPointFromNormalizedRect((double)v25 / v24, v26, v37, v38, v39);
          *(float *)&double v31 = v31;
          *(float *)&double v32 = v32;
          if (width_low) {
            *(float *)&double v32 = 1.0 - *(float *)&v32;
          }
          -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v17, "setGLPoint2D:forAttribute:atIndex:", v15, v19 + v25, v31, v32);
        }
        if (height_low)
        {
          *(float *)&double v29 = v21;
          *(float *)&double v30 = v23;
          -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v17, "setGLPoint2D:forAttribute:atIndex:", v16, v19 + v25, v29, v30);
        }
        ++v25;
      }
      while (v25 <= (unint64_t)(v42 + -1.0));
      unint64_t v20 = v36 + 1;
      v19 += v25;
    }
    while (v36 + 1 <= v35);
  }

  return v17;
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:", *(void *)&a5.width, 0, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:", 1, *(void *)&a5.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 textureFlipped:(BOOL)a5
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

- (void)enableDataBuffer
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_device)
  {
    self->_conformsToMetalProtocol = 1;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v3 = self->_arrayBuffers;
    uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) enableArrayBufferWithDevice:self->_device];
        }
        uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }

    if (!self->_metalElementData && self->_elementArrayCount)
    {
      [(TSDGPUDataBuffer *)self p_setupElementArrayBufferIfNecessary];
      double v10 = (MTLBuffer *)[(MTLDevice *)self->_device newBufferWithBytes:self->_gLElementData length:2 * self->_elementArrayCount options:0];
      metalElementData = self->_metalElementData;
      self->_metalElementData = v10;

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
    id v13 = [MEMORY[0x263F7C7F0] currentHandler];
    double v8 = [NSString stringWithUTF8String:"-[TSDGPUDataBuffer enableDataBuffer]"];
    double v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
    [v13 handleFailureInFunction:v8 file:v9 lineNumber:1051 description:@"Can't initialize metal buffers without a device!"];
  }
}

+ (id)newDataBufferWithVertexAttributes:(id)a3 vertexCount:(unint64_t)a4 indexElementCount:(unint64_t)a5 device:(id)a6
{
  id v11 = a6;
  id v12 = a3;
  id v13 = (id *)[objc_alloc((Class)a1) initWithVertexAttributes:v12 vertexCount:a4 indexElementCount:a5 bufferCount:3];

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
    id v11 = [MEMORY[0x263F7C7F0] currentHandler];
    id v12 = [NSString stringWithUTF8String:"+[TSDGPUDataBuffer newDataBufferWithVertexAttributes:meshSize:device:]"];
    id v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
    [v11 handleFailureInFunction:v12 file:v13 lineNumber:1080 description:@"Mesh size is not at least 2x2!"];
  }
  long long v14 = +[TSDGPUDataBuffer newDataBufferWithVertexAttributes:v8 vertexCount:(unint64_t)(width * height) indexElementCount:(unint64_t)((width + width) * (height + -1.0)) device:v9];
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
  id result = +[TSDGPUDataBuffer newDataBufferWithVertexAttributes:a3 vertexCount:4 * a4 indexElementCount:6 * a4 device:a5];
  if (result) {
    *((void *)result + 10) = a4;
  }
  return result;
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 device:(id)a5
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:device:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 textureFlipped:(BOOL)a5 device:(id)a6
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:", a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0x4000000000000000, 0x4000000000000000);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 device:(id)a6
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:device:", 1, *(void *)&a5.width, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 device:(id)a7
{
  return +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:device:", *(void *)&a5.width, 0, *(void *)&a5.height, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)newDataBufferWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 device:(id)a8
{
  BOOL v8 = a6;
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  double v22 = a4.size.width;
  double v23 = a4.size.height;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v13 = a3.size.height;
  double v14 = a3.size.width;
  double v15 = a3.origin.y;
  double v16 = a3.origin.x;
  id v18 = (id)a6;
  uint64_t v19 = objc_msgSend(objc_alloc((Class)a1), "initWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:", *(void *)&width, *(void *)&height, v16, v15, v14, v13, x, y, v22, v23, v24, v25);
  unint64_t v20 = (void *)v19;
  if (v19) {
    objc_storeStrong((id *)(v19 + 96), (id)v8);
  }

  return v20;
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
  uint64_t v21 = objc_msgSend(objc_alloc((Class)a1), "initWithVertexRect:textureRect:meshSize:textureFlipped:includeCenterAttribute:addTransparentBorder:", *(void *)&width, *(void *)&height, v10, v18, v17, v16, v15, x, y, v24, v25, v26, v27);
  double v22 = (void *)v21;
  if (v21) {
    objc_storeStrong((id *)(v21 + 96), (id)v9);
  }

  return v22;
}

- (void)teardown
{
  if (!self->_didTeardown)
  {
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
    metalElementData = self->_metalElementData;
    if (metalElementData)
    {
      self->_metalElementData = 0;
    }
    self->_didTeardown = 1;
  }
}

- (void)dealloc
{
  [(TSDGPUDataBuffer *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)TSDGPUDataBuffer;
  [(TSDGPUDataBuffer *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"vertexCount:%ld", -[TSDGPUDataBuffer vertexCount](self, "vertexCount"));
  [v3 addObject:v4];

  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"elementArrayCount:%ld", self->_elementArrayCount);
  [v3 addObject:v5];

  unint64_t elementArrayCount = self->_elementArrayCount;
  if (!elementArrayCount) {
    goto LABEL_9;
  }
  unint64_t v7 = 2 * elementArrayCount;
  if (2 * elementArrayCount <= 0x100000)
  {
    if (v7 < 0x401)
    {
      BOOL v10 = 0;
      goto LABEL_8;
    }
    BOOL v8 = @"(%0.1fKB)";
    double v9 = 0.0009765625;
  }
  else
  {
    BOOL v8 = @"(%0.1fMB)";
    double v9 = 0.000000953674316;
  }
  BOOL v10 = objc_msgSend(NSString, "stringWithFormat:", v8, v9 * (double)v7);
LABEL_8:
  id v11 = [NSString stringWithFormat:@"elementBufferSize:%ldB%@", v7, v10];
  [v3 addObject:v11];

LABEL_9:
  id v12 = [NSString stringWithFormat:@"arrayBuffers:%@", self->_arrayBuffers];
  [v3 addObject:v12];

  unint64_t v13 = [(TSDGPUDataBuffer *)self metalDrawMode];
  if (v13 > 4) {
    double v14 = @"Unknown";
  }
  else {
    double v14 = off_2646B1E78[v13];
  }
  double v15 = [NSString stringWithFormat:@"drawMode:%@", v14];
  [v3 addObject:v15];

  double v16 = NSString;
  v21.receiver = self;
  v21.super_class = (Class)TSDGPUDataBuffer;
  double v17 = [(TSDGPUDataBuffer *)&v21 description];
  double v18 = [v3 componentsJoinedByString:@","];
  uint64_t v19 = [v16 stringWithFormat:@"%@: {%@}", v17, v18];

  return (NSString *)v19;
}

- (void)setDrawMode:(unsigned int)a3
{
  self->_drawMode = a3;
}

- (void)setGLushort:(unsigned __int16)a3 forIndexElement:(unint64_t)a4
{
  self->_gLElementData[a4] = a3;
}

- (void)setMetalDrawMode:(unint64_t)a3
{
  self->_metalDrawMode = a3;
}

- (void)disableWithDevice:(id)a3
{
  self->_metalElementData = 0;
  MEMORY[0x270F9A758]();
}

- (void)encodeWithEncoder:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v7 = self->_arrayBuffers;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11), "encodeArrayBufferWithEncoder:atIndex:", v6, a4 + v11, (void)v12);
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      a4 += v11;
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
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v11 = a3;
  [(TSDGPUDataBuffer *)self enableDataBuffer];
  if (!self->_conformsToMetalProtocol)
  {
    long long v12 = [MEMORY[0x263F7C7F0] currentHandler];
    long long v13 = [NSString stringWithUTF8String:"-[TSDGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:]"];
    long long v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
    [v12 handleFailureInFunction:v13 file:v14 lineNumber:1264 description:@"Can only be called on a buffer that conforms to metal protocol!"];
  }
  [(TSDGPUDataBuffer *)self encodeWithEncoder:v11 atIndex:a4];
  if (self->_gLElementDataBufferWasSetup && self->_elementArrayCount)
  {
    double height = self->_gLElementMeshSize.height;
    if (self->_gLElementMeshSize.width == *MEMORY[0x263F001B0] && height == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      objc_msgSend(v11, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", -[TSDGPUDataBuffer metalDrawMode](self, "metalDrawMode", height), length, 0, self->_metalElementData, 2 * location);
    }
    else if (height + -1.0 > 0.0)
    {
      unint64_t v17 = 0;
      uint64_t v18 = 1;
      do
      {
        objc_msgSend(v11, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:", -[TSDGPUDataBuffer metalDrawMode](self, "metalDrawMode"), (unint64_t)(self->_gLElementMeshSize.width + self->_gLElementMeshSize.width), 0, self->_metalElementData, (unint64_t)(self->_gLElementMeshSize.width * (double)v17 + self->_gLElementMeshSize.width * (double)v17));
        CGFloat v19 = (double)v18++;
        v17 += 2;
      }
      while (self->_gLElementMeshSize.height + -1.0 > v19);
    }
  }
  else
  {
    objc_msgSend(v11, "drawPrimitives:vertexStart:vertexCount:", -[TSDGPUDataBuffer metalDrawMode](self, "metalDrawMode"), (int)location, length);
  }
  if ([(TSDGPUDataBuffer *)self isDynamicallyBuffered] && v6)
  {
    arrayBuffers = self->_arrayBuffers;
    self->_currentBufferIndedouble x = (self->_currentBufferIndex + 1) % 3;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    objc_super v21 = arrayBuffers;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v26, "bufferCount", (void)v27) != 1) {
            [v26 setCurrentBufferIndex:self->_currentBufferIndex];
          }
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v23);
    }
  }
  objc_msgSend(v11, "popDebugGroup", (void)v27);
}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4
{
  unint64_t elementArrayCount = self->_elementArrayCount;
  if (!elementArrayCount) {
    unint64_t elementArrayCount = self->_vertexCount;
  }
  -[TSDGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:](self, "drawWithEncoder:atIndex:range:advanceDynamicBuffer:", a3, a4, 0, elementArrayCount, 1);
}

- (void)drawWithEncoder:(id)a3 atIndex:(unint64_t)a4 advanceDynamicBuffer:(BOOL)a5
{
  unint64_t elementArrayCount = self->_elementArrayCount;
  if (!elementArrayCount) {
    unint64_t elementArrayCount = self->_vertexCount;
  }
  -[TSDGPUDataBuffer drawWithEncoder:atIndex:range:advanceDynamicBuffer:](self, "drawWithEncoder:atIndex:range:advanceDynamicBuffer:", a3, a4, 0, elementArrayCount, a5);
}

- (float)metalFloatForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 dataArrayBuffer];
  [v6 metalFloatForAttribute:v5 atIndex:a4];
  float v8 = v7;

  return v8;
}

- (void)setMetalFloat:(float)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a4;
  id v9 = [v7 dataArrayBuffer];
  *(float *)&double v8 = a3;
  [v9 setMetalFloat:v7 forAttribute:a5 atIndex:v8];
}

- (void)setCGFloat:(double)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  *(float *)&a3 = a3;
  [(TSDGPUDataBuffer *)self setMetalFloat:a4 forAttribute:a5 atIndex:a3];
}

- ($94F468A8D4C62B317260615823C2B210)metalPoint2DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 dataArrayBuffer];
  [v6 metalPoint2DForAttribute:v5 atIndex:a4];
  float v8 = v7;
  float v10 = v9;

  float v11 = v8;
  float v12 = v10;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)metalPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 dataArrayBuffer];
  [v6 metalPoint3DForAttribute:v5 atIndex:a4];
  float v8 = v7;
  float v10 = v9;
  float v12 = v11;

  float v13 = v8;
  float v14 = v10;
  float v15 = v12;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)metalPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 dataArrayBuffer];
  [v6 metalPoint4DForAttribute:v5 atIndex:a4];
  float v8 = v7;
  float v10 = v9;
  float v12 = v11;
  float v14 = v13;

  float v15 = v8;
  float v16 = v10;
  float v17 = v12;
  float v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)setMetalPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v8 = a4;
  id v11 = [v8 dataArrayBuffer];
  *(float *)&double v9 = var0;
  *(float *)&double v10 = var1;
  objc_msgSend(v11, "setMetalPoint2D:forAttribute:atIndex:", v8, a5, v9, v10);
}

- (void)setMetalPoint3D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var2 = a3.var2;
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v9 = a4;
  id v13 = [v9 dataArrayBuffer];
  *(float *)&double v10 = var0;
  *(float *)&double v11 = var1;
  *(float *)&double v12 = var2;
  objc_msgSend(v13, "setMetalPoint3D:forAttribute:atIndex:", v9, a5, v10, v11, v12);
}

- (void)setMetalPoint4D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
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
  objc_msgSend(v15, "setMetalPoint4D:forAttribute:atIndex:", v10, a5, v11, v12, v13, v14);
}

- (void)setGLPoint2D:(id)a3 forAttribute:(id)a4 atIndex:(unint64_t)a5
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  id v8 = a4;
  id v11 = [v8 dataArrayBuffer];
  *(float *)&double v9 = var0;
  *(float *)&double v10 = var1;
  objc_msgSend(v11, "setMetalPoint2D:forAttribute:atIndex:", v8, a5, v9, v10);
}

- ($E2C29196C7A5C696474C6955C5A9CE06)GLPoint3DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 dataArrayBuffer];
  [v6 metalPoint3DForAttribute:v5 atIndex:a4];
  float v8 = v7;
  float v10 = v9;
  float v12 = v11;

  float v13 = v8;
  float v14 = v10;
  float v15 = v12;
  result.float var2 = v15;
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
  objc_msgSend(v13, "setMetalPoint3D:forAttribute:atIndex:", v9, a5, v10, v11, v12);
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)GLPoint4DForAttribute:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 dataArrayBuffer];
  [v6 metalPoint4DForAttribute:v5 atIndex:a4];
  float v8 = v7;
  float v10 = v9;
  float v12 = v11;
  float v14 = v13;

  float v15 = v8;
  float v16 = v10;
  float v17 = v12;
  float v18 = v14;
  result.float var3 = v18;
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
  objc_msgSend(v15, "setMetalPoint4D:forAttribute:atIndex:", v10, a5, v11, v12, v13, v14);
}

- (void)setDataForAttribute:(id)a3 atIndex:(unint64_t)a4 fromAttribute:(id)a5 dataBuffer:(id)a6 index:(unint64_t)a7
{
  id v17 = a3;
  id v12 = a5;
  id v13 = a6;
  switch([v17 componentCount])
  {
    case 1u:
      [v13 metalFloatForAttribute:v12 atIndex:a7];
      -[TSDGPUDataBuffer setMetalFloat:forAttribute:atIndex:](self, "setMetalFloat:forAttribute:atIndex:", v17, a4);
      break;
    case 2u:
      [v13 metalPoint2DForAttribute:v12 atIndex:a7];
      -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](self, "setGLPoint2D:forAttribute:atIndex:", v17, a4);
      break;
    case 3u:
      [v13 metalPoint3DForAttribute:v12 atIndex:a7];
      -[TSDGPUDataBuffer setGLPoint3D:forAttribute:atIndex:](self, "setGLPoint3D:forAttribute:atIndex:", v17, a4);
      break;
    case 4u:
      [v13 metalPoint4DForAttribute:v12 atIndex:a7];
      -[TSDGPUDataBuffer setGLPoint4D:forAttribute:atIndex:](self, "setGLPoint4D:forAttribute:atIndex:", v17, a4);
      break;
    default:
      double v14 = [MEMORY[0x263F7C7F0] currentHandler];
      id v15 = [NSString stringWithUTF8String:"-[TSDGPUDataBuffer setDataForAttribute:atIndex:fromAttribute:dataBuffer:index:]"];
      float v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
      [v14 handleFailureInFunction:v15 file:v16 lineNumber:1411 description:@"Unknown attribute size!"];

      break;
  }
}

- (id)vertexAttributeNamed:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(TSDGPUDataBuffer *)self vertexAttributes];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        float v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 name];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
  id v5 = [(TSDGPUDataBuffer *)self vertexAttributes];
  [(TSDGPUDataBuffer *)self updateMetalDataBufferAttributes:v5 withBlock:v4];
}

- (void)updateMetalDataBufferAttributes:(id)a3 withBlock:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void *, size_t))a4;
  if (v13 && [v13 count])
  {
    self->_isUpdatingRawDataBuffer = 1;
    size_t v7 = [v13 count];
    float v8 = (char *)malloc_type_calloc(0x58uLL, v7, 0x76CA510uLL);
    float v9 = v8;
    if (v7)
    {
      uint64_t v10 = 0;
      char v11 = v8;
      do
      {
        id v12 = [v13 objectAtIndex:v10];
        [(TSDGPUDataBuffer *)self p_setAttributeUpdateData:v11 fromAttribute:v12];

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
  id v6 = (void (**)(id, void *, size_t))a4;
  if (v19 && [v19 count])
  {
    self->_isUpdatingRawDataBuffer = 1;
    size_t v7 = [v19 count];
    float v8 = (uint64_t *)malloc_type_calloc(0x58uLL, v7, 0x5BBB350CuLL);
    float v9 = v8;
    if (v7)
    {
      uint64_t v10 = 0;
      char v11 = (char *)v8;
      do
      {
        id v12 = [v19 objectAtIndex:v10];
        [(TSDGPUDataBuffer *)self p_setAttributeUpdateData:v11 fromAttribute:v12];

        ++v10;
        v11 += 88;
      }
      while (v7 != v10);
      v6[2](v6, v9, v7);
      self->_isUpdatingRawDataBuffer = 0;
      uint64_t v13 = 0;
      long long v14 = v9 + 9;
      do
      {
        if (*(unsigned char *)(v14 - 2))
        {
          uint64_t v16 = *(v14 - 1);
          uint64_t v15 = *v14;
          id v17 = [v19 objectAtIndex:v13];
          uint64_t v18 = [v17 dataArrayBuffer];
          objc_msgSend(v18, "addIndexRangeNeedsUpdate:", v16, v15);
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

- (TSDGPUDataBuffer)initWithVertexRect:(CGRect)a3 textureRect:(CGRect)a4 meshSize:(CGSize)a5 textureFlipped:(BOOL)a6 includeCenterAttribute:(BOOL)a7 addTransparentBorder:(BOOL)a8
{
  BOOL v8 = a6;
  int height_low = LODWORD(a5.height);
  int width_low = LODWORD(a5.width);
  CGRect v38 = a3;
  CGRect v37 = a4;
  BOOL v11 = CGRectEqualToRect(a4, *MEMORY[0x263F001A8]);
  if (v8) {
    objc_msgSend((id)objc_opt_class(), "p_addTransparentBorderInsetToTextureRect:vertexRect:", &v37, &v38);
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v13 = [[TSDGPUDataBufferAttribute alloc] initWithName:@"Position" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
  [v12 addObject:v13];
  if (v11)
  {
    long long v14 = 0;
  }
  else
  {
    long long v14 = [[TSDGPUDataBufferAttribute alloc] initWithName:@"TexCoord" bufferUsage:35044 dataType:3 normalized:1 componentCount:2];
    [v12 addObject:v14];
  }
  if (height_low)
  {
    uint64_t v15 = [[TSDGPUDataBufferAttribute alloc] initWithName:@"Center" bufferUsage:35044 dataType:5 normalized:0 componentCount:2];
    [v12 addObject:v15];
  }
  else
  {
    uint64_t v15 = 0;
  }
  CGFloat v33 = v12;
  uint64_t v16 = -[TSDGPUDataBuffer initWithVertexAttributes:meshSize:bufferCount:](self, "initWithVertexAttributes:meshSize:bufferCount:", v12, 1, v39, v40);
  if (v16)
  {
    v16->_positionAttributeIndedouble x = [v12 indexOfObject:v13];
    if (!v11) {
      v16->_texCoordAttributeIndedouble x = [v12 indexOfObject:v14];
    }
    if (height_low) {
      v16->_centerAttributeIndedouble x = [v12 indexOfObject:v15];
    }
    double v17 = TSDCenterOfRect(v38.origin.x, v38.origin.y, v38.size.width, v38.size.height);
    uint64_t v18 = 0;
    unint64_t v19 = 0;
    float v20 = v17;
    unint64_t v34 = (unint64_t)(v40 + -1.0);
    float v22 = v21;
    double v23 = (double)(unint64_t)(v39 + -1.0);
    do
    {
      unint64_t v24 = 0;
      unint64_t v35 = v19;
      double v25 = (double)v19 / (double)v34;
      do
      {
        double v26 = TSDPointFromNormalizedRect((double)v24 / v23, v25, v38.origin.x, v38.origin.y, v38.size.width);
        *(float *)&double v26 = v26;
        *(float *)&double v27 = v27;
        -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v16, "setGLPoint2D:forAttribute:atIndex:", v13, v18 + v24, v26, v27);
        if (!v11)
        {
          double v30 = TSDPointFromNormalizedRect((double)v24 / v23, v25, v37.origin.x, v37.origin.y, v37.size.width);
          *(float *)&double v30 = v30;
          *(float *)&double v31 = v31;
          if (width_low) {
            *(float *)&double v31 = 1.0 - *(float *)&v31;
          }
          -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v16, "setGLPoint2D:forAttribute:atIndex:", v14, v18 + v24, v30, v31);
        }
        if (height_low)
        {
          *(float *)&double v28 = v20;
          *(float *)&double v29 = v22;
          -[TSDGPUDataBuffer setGLPoint2D:forAttribute:atIndex:](v16, "setGLPoint2D:forAttribute:atIndex:", v15, v18 + v24, v28, v29);
        }
        ++v24;
      }
      while (v24 <= (unint64_t)(v39 + -1.0));
      unint64_t v19 = v35 + 1;
      v18 += v24;
    }
    while (v35 + 1 <= v34);
  }

  return v16;
}

- (BOOL)p_setAttributeUpdateData:(id *)a3 fromAttribute:(id)a4
{
  id v6 = a4;
  size_t v7 = v6;
  BOOL isUpdatingRawDataBuffer = self->_isUpdatingRawDataBuffer;
  if (self->_isUpdatingRawDataBuffer)
  {
    float v9 = [v6 dataArrayBuffer];
    a3->float var3 = (char *)[v9 dataPointer];

    a3->float var0 = [v7 dataType];
    a3->float var1 = (int)[v7 componentCount];
    a3->float var2 = [v7 isNormalized];
    a3->var4 = [v7 bufferOffset];
    uint64_t v10 = [v7 dataArrayBuffer];
    a3->var5 = [v10 dataBufferEntrySize];

    BOOL v11 = [v7 dataArrayBuffer];
    a3->NSUInteger var6 = [v11 vertexCount];

    a3->var7 = 1;
    NSUInteger var6 = a3->var6;
    a3->var8.NSUInteger location = 0;
    a3->var8.int length = var6;
    a3->var9 = TSDGPUDataBufferDataTypeSize([v7 dataType]);
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F7C7F0] currentHandler];
    long long v14 = [NSString stringWithUTF8String:"-[TSDGPUDataBuffer p_setAttributeUpdateData:fromAttribute:]"];
    uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUDataBuffer.m"];
    [v13 handleFailureInFunction:v14 file:v15 lineNumber:1572 description:@"Can only be called from within update block!"];
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