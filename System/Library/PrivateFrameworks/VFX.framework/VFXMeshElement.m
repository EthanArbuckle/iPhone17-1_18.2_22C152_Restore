@interface VFXMeshElement
+ (BOOL)supportsSecureCoding;
+ (id)_optimizedmodelElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6;
+ (id)geometryElementWithMeshElementRef:(id *)a3;
+ (id)meshElementWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6;
+ (id)meshElementWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8;
+ (id)meshElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6;
+ (id)meshElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8;
+ (id)modelElementWithMDLSubmesh:(id)a3;
- (BOOL)hasInterleavedIndicesChannels;
- (NSData)data;
- (VFXMeshElement)init;
- (VFXMeshElement)initWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8;
- (VFXMeshElement)initWithCoder:(id)a3;
- (VFXMeshElement)initWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8;
- (VFXMeshElement)initWithMeshElement:(const void *)a3;
- (_NSRange)primitiveRange;
- (__CFXMeshElement)meshElement;
- (__CFXWorld)worldRef;
- (float)_computeACMR;
- (float)maximumPointScreenSpaceRadius;
- (float)minimumPointScreenSpaceRadius;
- (float)pointSize;
- (id)description;
- (id)primitiveRanges;
- (id)world;
- (int64_t)bytesPerIndex;
- (int64_t)indicesChannelCount;
- (int64_t)primitiveCount;
- (int64_t)primitiveType;
- (unint64_t)indexCount;
- (void)_optimizeTriangleIndices;
- (void)_printData;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateIndexes:(id)a3;
- (void)setMaximumPointScreenSpaceRadius:(float)a3;
- (void)setMinimumPointScreenSpaceRadius:(float)a3;
- (void)setPointSize:(float)a3;
- (void)setPrimitiveRange:(_NSRange)a3;
- (void)setPrimitiveRanges:(id)a3;
@end

@implementation VFXMeshElement

- (VFXMeshElement)initWithMeshElement:(const void *)a3
{
  v39.receiver = a1;
  v39.super_class = (Class)VFXMeshElement;
  v10 = [(VFXMeshElement *)&v39 init];
  __asm { FMOV            V0.2S, #1.0 }
  *(void *)&v10->_pointSize = _D0;
  v10->_maximumPointScreenSpaceRadius = 1.0;
  if (a3)
  {
    sub_1B6583684((uint64_t)a3, v10, v4, v5, v6, v7, v8, v9);
    unsigned int v38 = 0;
    v10->_meshElement = (__CFXMeshElement *)CFRetain(a3);
    v10->_elementData = (NSData *)(id)sub_1B63D0F38((uint64_t)a3, &v38);
    v10->_primitiveType = (int)sub_1B63D0C08((uint64_t)a3, v16, v17, v18, v19, v20, v21, v22);
    v10->_primitiveCount = sub_1B63D11E8((uint64_t)a3);
    v10->_indicesChannelCount = sub_1B63D11A8((uint64_t)a3);
    v10->_interleavedIndicesChannels = sub_1B63D11B0((uint64_t)a3);
    unsigned __int16 v37 = 0;
    uint64_t v23 = sub_1B63D0FD4((uint64_t)a3, &v37);
    if (v23)
    {
      uint64_t v24 = v23;
      id v25 = objc_alloc(MEMORY[0x1E4F1CA48]);
      v29 = (NSArray *)objc_msgSend_initWithCapacity_(v25, v26, v37, v27);
      if (v37)
      {
        unint64_t v30 = 0;
        v31 = (uint64_t *)(v24 + 8);
        do
        {
          uint64_t v32 = *v31;
          if (*(v31 - 1) == -1) {
            uint64_t v33 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v28, 0x7FFFFFFFFFFFFFFFLL, v32);
          }
          else {
            uint64_t v33 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v28, *(v31 - 1), v32);
          }
          objc_msgSend_addObject_(v29, v34, v33, v35);
          ++v30;
          v31 += 2;
        }
        while (v30 < v37);
      }
      v10->_primitiveRanges = v29;
    }
    v10->_bytesPerIndex = v38;
    v10->_pointSize = sub_1B63D11B8((uint64_t)a3);
    v10->_minimumPointScreenSpaceRadius = sub_1B63D11C8((uint64_t)a3);
    v10->_maximumPointScreenSpaceRadius = sub_1B63D11D8((uint64_t)a3);
  }
  return v10;
}

- (VFXMeshElement)init
{
  return (VFXMeshElement *)objc_msgSend_initWithMeshElement_(self, a2, 0, v2);
}

- (void)dealloc
{
  meshElement = self->_meshElement;
  if (meshElement)
  {
    sub_1B6583684((uint64_t)meshElement, 0, v2, v3, v4, v5, v6, v7);
    v10 = self->_meshElement;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1B63F76DC;
    v13[3] = &unk_1E6140A18;
    v13[4] = v10;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, 0, 0, v13);
  }

  v12.receiver = self;
  v12.super_class = (Class)VFXMeshElement;
  [(VFXMeshElement *)&v12 dealloc];
}

- (void)enumerateIndexes:(id)a3
{
  uint64_t v6 = objc_msgSend_indexCount(self, a2, (uint64_t)a3, v3);
  v10 = objc_msgSend_data(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_bytes(v10, v11, v12, v13);
  switch(objc_msgSend_bytesPerIndex(self, v15, v16, v17))
  {
    case 1:
      if (v6)
      {
        for (uint64_t i = 0; i != v6; ++i)
          (*((void (**)(id, uint64_t, void))a3 + 2))(a3, i, *(unsigned __int8 *)(v14 + i));
      }
      break;
    case 2:
      if (v6)
      {
        for (uint64_t j = 0; j != v6; ++j)
          (*((void (**)(id, uint64_t, void))a3 + 2))(a3, j, *(unsigned __int16 *)(v14 + 2 * j));
      }
      break;
    case 4:
      if (v6)
      {
        for (uint64_t k = 0; k != v6; ++k)
          (*((void (**)(id, uint64_t, void))a3 + 2))(a3, k, *(unsigned int *)(v14 + 4 * k));
      }
      break;
    case 8:
      if (v6)
      {
        for (uint64_t m = 0; m != v6; ++m)
          (*((void (**)(id, uint64_t, void))a3 + 2))(a3, m, *(void *)(v14 + 8 * m));
      }
      break;
    default:
      return;
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v4);
  unint64_t primitiveType = self->_primitiveType;
  int64_t primitiveCount = self->_primitiveCount;
  if (primitiveType > 4) {
    uint64_t v13 = @"unknown";
  }
  else {
    uint64_t v13 = (__CFString *)*((void *)&off_1E6141460 + primitiveType);
  }
  int64_t indicesChannelCount = self->_indicesChannelCount;
  int v15 = sub_1B63CADD8(self->_bytesPerIndex, 1, 0, v5, v6, v7, v8, v9);
  uint64_t v23 = sub_1B63CA8A4(v15, v16, v17, v18, v19, v20, v21, v22);
  return (id)objc_msgSend_stringWithFormat_(v3, v24, @"<%@: %p | %u x %@, %u channels, %@ indices>", v25, v10, self, primitiveCount, v13, indicesChannelCount, v23);
}

+ (id)meshElementWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  BOOL v9 = a7;
  id v14 = objc_alloc((Class)objc_opt_class());
  uint64_t v16 = objc_msgSend_initWithBuffer_primitiveType_primitiveCount_indicesChannelCount_interleavedIndicesChannels_bytesPerIndex_(v14, v15, (uint64_t)a3, a4, a5, a6, v9, a8);

  return v16;
}

- (VFXMeshElement)initWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  v22.receiver = self;
  v22.super_class = (Class)VFXMeshElement;
  uint64_t v20 = [(VFXMeshElement *)&v22 init];
  if (v20)
  {
    if (a4 == 4) {
      sub_1B63F2F54(16, @"Unreachable code: VFXMeshPrimitiveTypePolygon not supported with MTLBuffers", v14, v15, v16, v17, v18, v19, (uint64_t)v22.receiver);
    }
    v20->_mtlBuffer = (MTLBuffer *)a3;
    v20->_unint64_t primitiveType = a4;
    v20->_int64_t primitiveCount = a5;
    v20->_int64_t indicesChannelCount = a6;
    v20->_interleavedIndicesChannels = a7;
    v20->_bytesPerIndex = a8;
  }
  return v20;
}

- (VFXMeshElement)initWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  v34.receiver = self;
  v34.super_class = (Class)VFXMeshElement;
  uint64_t v17 = [(VFXMeshElement *)&v34 init];
  if (!v17) {
    return v17;
  }
  if (a4 != 4) {
    goto LABEL_21;
  }
  if (objc_msgSend_length(a3, v14, v15, v16) < (unint64_t)(a8 * a5)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. VFXMeshElement initialization - Invalid data length", v15, v16, v18, v19, v20, v21, (uint64_t)"data.length >= (NSUInteger)(primitiveCount * bytesPerIndex)");
  }
  if (a5 < 1)
  {
LABEL_20:
    uint64_t v31 = objc_msgSend_length(a3, v14, v15, v16);
    a3 = (id)objc_msgSend_subdataWithRange_(a3, v32, a8 * a5, v31 - a8 * a5);
    a4 = 0;
    goto LABEL_21;
  }
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  BOOL v24 = 1;
  while (1)
  {
    uint64_t v25 = objc_msgSend_bytes(a3, v14, v15, v16);
    switch(a8)
    {
      case 4:
        unint64_t v30 = *(unsigned int *)(v25 + v22);
        break;
      case 2:
        unint64_t v30 = *(unsigned __int16 *)(v25 + v22);
        break;
      case 1:
        unint64_t v30 = *(unsigned __int8 *)(v25 + v22);
        break;
      default:
        sub_1B63F2F54(16, @"Error: VFXMeshElement initialization - Invalid index size (%ld bytes)", v15, v16, v26, v27, v28, v29, a8);
        goto LABEL_24;
    }
    if (v30 <= 2)
    {
      sub_1B63F2F54(16, @"Error: VFXMeshElement initialization - Invalid polygon edge count (%ld)", v15, v16, v26, v27, v28, v29, v30);
LABEL_24:

      return 0;
    }
    if (v30 != 3) {
      break;
    }
    BOOL v24 = ++v23 < a5;
    v22 += a8;
    if (a5 == v23) {
      goto LABEL_20;
    }
  }
  if (!v24) {
    goto LABEL_20;
  }
  a4 = 4;
LABEL_21:
  v17->_elementData = (NSData *)objc_msgSend_copy(a3, v14, v15, v16);
  v17->_unint64_t primitiveType = a4;
  v17->_int64_t primitiveCount = a5;
  v17->_int64_t indicesChannelCount = a6;
  v17->_interleavedIndicesChannels = a7;
  v17->_bytesPerIndex = a8;
  return v17;
}

+ (id)geometryElementWithMeshElementRef:(id *)a3
{
  result = sub_1B6583674(a3);
  if (!result)
  {
    id v6 = [a1 alloc];
    BOOL v9 = objc_msgSend_initWithMeshElement_(v6, v7, (uint64_t)a3, v8);
    return (id *)v9;
  }
  return result;
}

+ (id)meshElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 indicesChannelCount:(int64_t)a6 interleavedIndicesChannels:(BOOL)a7 bytesPerIndex:(int64_t)a8
{
  BOOL v9 = a7;
  id v14 = objc_alloc((Class)a1);
  uint64_t v16 = objc_msgSend_initWithData_primitiveType_primitiveCount_indicesChannelCount_interleavedIndicesChannels_bytesPerIndex_(v14, v15, (uint64_t)a3, a4, a5, a6, v9, a8);

  return v16;
}

+ (id)meshElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6
{
  id v10 = objc_alloc((Class)a1);
  uint64_t v12 = objc_msgSend_initWithData_primitiveType_primitiveCount_indicesChannelCount_interleavedIndicesChannels_bytesPerIndex_(v10, v11, (uint64_t)a3, a4, a5, 1, 1, a6);

  return v12;
}

+ (id)meshElementWithBuffer:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6
{
  return (id)MEMORY[0x1F4181798](a1, sel_meshElementWithBuffer_primitiveType_primitiveCount_indicesChannelCount_interleavedIndicesChannels_bytesPerIndex_, a3, a4);
}

- (NSData)data
{
  result = self->_elementData;
  if (!result)
  {
    result = (NSData *)self->_mtlBuffer;
    if (result)
    {
      id v6 = (void *)MEMORY[0x1E4F1C9B8];
      uint64_t v7 = objc_msgSend_contents(result, a2, v2, v3);
      uint64_t v12 = objc_msgSend_length(self->_mtlBuffer, v8, v9, v10);
      return (NSData *)objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v6, v11, v7, v12, 0);
    }
  }
  return result;
}

- (void)_printData
{
  uint64_t v4 = objc_msgSend_meshElement(self, a2, v2, v3);

  sub_1B63D31CC(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (unint64_t)indexCount
{
  uint64_t v4 = objc_msgSend_meshElement(self, a2, v2, v3);

  return sub_1B63D0CA8(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (int64_t)primitiveType
{
  return self->_primitiveType;
}

- (int64_t)primitiveCount
{
  return self->_primitiveCount;
}

- (int64_t)indicesChannelCount
{
  return self->_indicesChannelCount;
}

- (BOOL)hasInterleavedIndicesChannels
{
  return self->_interleavedIndicesChannels;
}

- (__CFXWorld)worldRef
{
  uint64_t v4 = objc_msgSend___CFObject(self, a2, v2, v3);

  return (__CFXWorld *)sub_1B63F4F54(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (id)world
{
  id result = (id)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
  {
    return sub_1B6583674((id *)result);
  }
  return result;
}

- (_NSRange)primitiveRange
{
  if (objc_msgSend_count(self->_primitiveRanges, a2, v2, v3) == 1)
  {
    uint64_t v7 = objc_msgSend_objectAtIndexedSubscript_(self->_primitiveRanges, v5, 0, v6);
    NSUInteger v11 = objc_msgSend_rangeValue(v7, v8, v9, v10);
  }
  else
  {
    NSUInteger v11 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger v12 = 0;
  }
  result.length = v12;
  result.location = v11;
  return result;
}

- (void)setPrimitiveRange:(_NSRange)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], a2, a3.location, a3.length);
  uint64_t v5 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v4, (uint64_t)v8, 1);
  objc_msgSend_setPrimitiveRanges_(self, v6, v5, v7);
}

- (id)primitiveRanges
{
  return self->_primitiveRanges;
}

- (void)setPrimitiveRanges:(id)a3
{
  primitiveRanges = self->_primitiveRanges;
  if (primitiveRanges != a3)
  {

    uint64_t v9 = (NSArray *)objc_msgSend_count(a3, v6, v7, v8);
    if (v9) {
      uint64_t v9 = (NSArray *)objc_msgSend_copy(a3, v10, v11, v12);
    }
    self->_primitiveRanges = v9;
    uint64_t v13 = objc_msgSend_worldRef(self, v10, v11, v12);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1B63F7FF8;
    v15[3] = &unk_1E6141230;
    v15[4] = self;
    v15[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, 0, v15);
  }
}

- (float)pointSize
{
  return self->_pointSize;
}

- (void)setPointSize:(float)a3
{
  if (self->_pointSize != a3)
  {
    self->_pointSize = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63F8190;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, 0, v9);
  }
}

- (float)minimumPointScreenSpaceRadius
{
  return self->_minimumPointScreenSpaceRadius;
}

- (void)setMinimumPointScreenSpaceRadius:(float)a3
{
  if (self->_minimumPointScreenSpaceRadius != a3)
  {
    self->_minimumPointScreenSpaceRadius = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63F825C;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, 0, v9);
  }
}

- (float)maximumPointScreenSpaceRadius
{
  return self->_maximumPointScreenSpaceRadius;
}

- (void)setMaximumPointScreenSpaceRadius:(float)a3
{
  if (self->_maximumPointScreenSpaceRadius != a3)
  {
    self->_maximumPointScreenSpaceRadius = a3;
    uint64_t v7 = objc_msgSend_worldRef(self, a2, v3, v4);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1B63F8328;
    v9[3] = &unk_1E6141208;
    v9[4] = self;
    float v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, 0, v9);
  }
}

- (int64_t)bytesPerIndex
{
  return self->_bytesPerIndex;
}

- (__CFXMeshElement)meshElement
{
  _NSRange result = self->_meshElement;
  if (!result)
  {
    uint64_t v4 = (__CFXMeshElement *)sub_1B63D0314();
    self->_meshElement = v4;
    mtlBuffer = self->_mtlBuffer;
    char primitiveType = self->_primitiveType;
    int64_t primitiveCount = self->_primitiveCount;
    BOOL interleavedIndicesChannels = self->_interleavedIndicesChannels;
    if (mtlBuffer) {
      sub_1B63D0520((uint64_t)v4, primitiveType, primitiveCount, LOBYTE(self->_indicesChannelCount), interleavedIndicesChannels, mtlBuffer, LODWORD(self->_bytesPerIndex), v5);
    }
    else {
      sub_1B63D0428((uint64_t)v4, primitiveType, primitiveCount, LOBYTE(self->_indicesChannelCount), interleavedIndicesChannels, self->_elementData, LODWORD(self->_bytesPerIndex), v5);
    }
    sub_1B63F8004((uint64_t)self->_meshElement, self->_primitiveRanges, v10, v11);
    _NSRange result = self->_meshElement;
    if (result)
    {
      sub_1B6583684((uint64_t)result, self, v12, v13, v14, v15, v16, v17);
      return self->_meshElement;
    }
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_elementData)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (uint64_t v8 = objc_msgSend_options(a3, v5, v6, v7),
          uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, @"VFXWorldExportCompressGeometryElements", v10), objc_msgSend_BOOLValue(v11, v12, v13, v14)))
    {
      elementData = self->_elementData;
      if (!self->_primitiveType) {
        elementData = objc_msgSend_vfx_indexedDataEncodingTrianglePairsWithBytesPerIndex_(elementData, v5, self->_bytesPerIndex, v15);
      }
      uint64_t v17 = objc_msgSend_vfx_indexedDataEncodingHighWatermarkWithBytesPerIndex_(elementData, v5, self->_bytesPerIndex, v15);
      uint64_t v20 = objc_msgSend_vfx_compressedDataUsingCompressionAlgorithm_(v17, v18, 774, v19);
      objc_msgSend_encodeObject_forKey_(a3, v21, v20, @"compressedElementData");
    }
    else
    {
      objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_elementData, @"elementData");
    }
  }
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_primitiveType, @"primitiveType");
  objc_msgSend_encodeInteger_forKey_(a3, v22, self->_primitiveCount, @"primitiveCount");
  if (objc_msgSend_count(self->_primitiveRanges, v23, v24, v25) == 1)
  {
    uint64_t v28 = objc_msgSend_objectAtIndexedSubscript_(self->_primitiveRanges, v26, 0, v27);
    uint64_t v32 = objc_msgSend_rangeValue(v28, v29, v30, v31);
    uint64_t v34 = (uint64_t)v33;
    objc_msgSend_encodeInteger_forKey_(a3, v33, v32, @"primitiveRangeLocation");
    objc_msgSend_encodeInteger_forKey_(a3, v35, v34, @"primitiveRangeLength");
  }
  objc_msgSend_encodeInteger_forKey_(a3, v26, self->_indicesChannelCount, @"indicesChannelCount");
  objc_msgSend_encodeBool_forKey_(a3, v36, self->_interleavedIndicesChannels, @"interleavedIndicesChannels");
  objc_msgSend_encodeInteger_forKey_(a3, v37, self->_bytesPerIndex, @"bytesPerIndex");
  *(float *)&double v38 = self->_pointSize;
  objc_msgSend_encodeFloat_forKey_(a3, v39, @"ptSize", v40, v38);
  *(float *)&double v41 = self->_minimumPointScreenSpaceRadius;
  objc_msgSend_encodeFloat_forKey_(a3, v42, @"minimumPointScreenSpaceRadius", v43, v41);
  *(float *)&double v46 = self->_maximumPointScreenSpaceRadius;

  objc_msgSend_encodeFloat_forKey_(a3, v44, @"maximumPointScreenSpaceRadius", v45, v46);
}

- (VFXMeshElement)initWithCoder:(id)a3
{
  v58.receiver = self;
  v58.super_class = (Class)VFXMeshElement;
  uint64_t v7 = [(VFXMeshElement *)&v58 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v7->_char primitiveType = objc_msgSend_decodeIntegerForKey_(a3, v11, @"primitiveType", v12);
    v7->_int64_t primitiveCount = objc_msgSend_decodeIntegerForKey_(a3, v13, @"primitiveCount", v14);
    if (objc_msgSend_containsValueForKey_(a3, v15, @"primitiveRangeLocation", v16)
      && objc_msgSend_containsValueForKey_(a3, v17, @"primitiveRangeLength", v18))
    {
      uint64_t v19 = objc_msgSend_decodeIntegerForKey_(a3, v17, @"primitiveRangeLocation", v18);
      uint64_t v22 = objc_msgSend_decodeIntegerForKey_(a3, v20, @"primitiveRangeLength", v21);
      uint64_t v57 = objc_msgSend_valueWithRange_(MEMORY[0x1E4F29238], v23, v19, v22);
      id v24 = objc_alloc(MEMORY[0x1E4F1C978]);
      v7->_primitiveRanges = (NSArray *)objc_msgSend_initWithObjects_count_(v24, v25, (uint64_t)&v57, 1);
    }
    if (objc_msgSend_containsValueForKey_(a3, v17, @"indicesChannelCount", v18)
      && objc_msgSend_containsValueForKey_(a3, v26, @"interleavedIndicesChannels", v27))
    {
      v7->_int64_t indicesChannelCount = objc_msgSend_decodeIntegerForKey_(a3, v26, @"indicesChannelCount", v27);
      v7->_BOOL interleavedIndicesChannels = objc_msgSend_decodeBoolForKey_(a3, v28, @"interleavedIndicesChannels", v29);
    }
    else
    {
      v7->_int64_t indicesChannelCount = 1;
      v7->_BOOL interleavedIndicesChannels = 1;
    }
    v7->_bytesPerIndex = objc_msgSend_decodeIntegerForKey_(a3, v26, @"bytesPerIndex", v27);
    if (objc_msgSend_containsValueForKey_(a3, v30, @"ptSize", v31))
    {
      objc_msgSend_decodeFloatForKey_(a3, v32, @"pointSize", v33);
      v7->_pointSize = v34;
      objc_msgSend_decodeFloatForKey_(a3, v35, @"minimumPointScreenSpaceRadius", v36);
      v7->_minimumPointScreenSpaceRadius = v37;
      objc_msgSend_decodeFloatForKey_(a3, v38, @"maximumPointScreenSpaceRadius", v39);
      v7->_maximumPointScreenSpaceRadius = v40;
    }
    uint64_t v41 = objc_opt_class();
    uint64_t v43 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v42, v41, @"compressedElementData");
    if (v43)
    {
      double v46 = objc_msgSend_vfx_uncompressedDataUsingCompressionAlgorithm_(v43, v44, 774, v45);
      v49 = objc_msgSend_vfx_indexedDataDecodingHighWatermarkWithBytesPerIndex_(v46, v47, v7->_bytesPerIndex, v48);
      if (!v7->_primitiveType) {
        v49 = objc_msgSend_vfx_indexedDataDecodingTrianglePairsWithBytesPerIndex_(v49, v50, v7->_bytesPerIndex, v51);
      }
    }
    else
    {
      uint64_t v52 = objc_opt_class();
      v49 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v53, v52, @"elementData");
    }
    v7->_elementData = (NSData *)v49;
    objc_msgSend_setImmediateMode_(VFXTransaction, v54, v8, v55);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_optimizedmodelElementWithData:(id)a3 primitiveType:(int64_t)a4 primitiveCount:(int64_t)a5 bytesPerIndex:(int64_t)a6
{
  if (a4)
  {
    uint64_t v10 = objc_opt_class();
    id v12 = a3;
    int64_t v13 = a4;
  }
  else
  {
    CFDataRef v14 = sub_1B65E2A20((const __CFData *)a3, a5, a6);
    uint64_t v10 = objc_opt_class();
    id v12 = v14;
    int64_t v13 = 0;
  }

  return (id)objc_msgSend_meshElementWithData_primitiveType_primitiveCount_bytesPerIndex_(v10, v11, (uint64_t)v12, v13, a5, a6);
}

- (void)_optimizeTriangleIndices
{
  if (!self->_primitiveType)
  {
    sub_1B65E2D6C((uint64_t)self->_meshElement);
    unsigned int v10 = 0;
    self->_elementData = (NSData *)(id)sub_1B63D0F38((uint64_t)self->_meshElement, &v10);
    self->_char primitiveType = (int)sub_1B63D0C08((uint64_t)self->_meshElement, v3, v4, v5, v6, v7, v8, v9);
    self->_int64_t primitiveCount = sub_1B63D11E8((uint64_t)self->_meshElement);
    self->_bytesPerIndex = v10;
  }
}

- (float)_computeACMR
{
  return sub_1B65E2620((uint64_t)self->_meshElement, 0x20uLL, v2, v3, v4, v5, v6, v7);
}

+ (id)modelElementWithMDLSubmesh:(id)a3
{
  uint64_t v6 = objc_msgSend_faceIndexing(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_geometryType(a3, v7, v8, v9);
  if (v6)
  {
    if (v10 != 5) {
      return 0;
    }
    return (id)sub_1B646DCE0(a3, v11, v12, v13);
  }
  switch(v10)
  {
    case 0:
      goto LABEL_10;
    case 1:
      uint64_t v22 = (unint64_t)objc_msgSend_indexCount(a3, v11, v12, v13) >> 1;
      uint64_t v23 = 2;
      break;
    case 2:
      uint64_t v23 = 0;
      uint64_t v22 = objc_msgSend_indexCount(a3, v11, v12, v13) / 3uLL;
      break;
    case 3:
      uint64_t v22 = objc_msgSend_indexCount(a3, v11, v12, v13) - 2;
      uint64_t v23 = 1;
      break;
    case 4:
      uint64_t v22 = (unint64_t)objc_msgSend_indexCount(a3, v11, v12, v13) >> 2;
      goto LABEL_15;
    case 5:
      id v24 = objc_msgSend_topology(a3, v11, v12, v13);
      uint64_t v22 = objc_msgSend_faceCount(v24, v25, v26, v27);
LABEL_15:
      uint64_t v23 = 4;
      break;
    default:
      sub_1B63F2F54(16, @"Error: unknown MKGeometryType", v12, v13, v14, v15, v16, v17, v98);
LABEL_10:
      uint64_t v22 = objc_msgSend_indexCount(a3, v11, v12, v13);
      uint64_t v23 = 3;
      break;
  }
  unint64_t v28 = (unint64_t)objc_msgSend_indexType(a3, v19, v20, v21) >> 3;
  uint64_t v32 = objc_msgSend_indexBuffer(a3, v29, v30, v31);
  uint64_t v36 = objc_msgSend_map(v32, v33, v34, v35);
  uint64_t v40 = objc_msgSend_bytes(v36, v37, v38, v39);
  v44 = objc_msgSend_indexBuffer(a3, v41, v42, v43);
  uint64_t v48 = objc_msgSend_length(v44, v45, v46, v47);
  if (objc_msgSend_geometryType(a3, v49, v50, v51) == 4)
  {
    id v55 = objc_alloc(MEMORY[0x1E4F1CA58]);
    objc_super v58 = objc_msgSend_initWithCapacity_(v55, v56, v48 + v28 * v22, v57);
    objc_msgSend_setLength_(v58, v59, v28 * v22, v60);
    if (v22)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        switch(v28)
        {
          case 1uLL:
            *(unsigned char *)(objc_msgSend_mutableBytes(v58, v61, v62, v63) + i) = 4;
            break;
          case 2uLL:
            *(_WORD *)(objc_msgSend_mutableBytes(v58, v61, v62, v63) + 2 * i) = 4;
            break;
          case 4uLL:
            *(_DWORD *)(objc_msgSend_mutableBytes(v58, v61, v62, v63) + 4 * i) = 4;
            break;
          case 8uLL:
            *(void *)(objc_msgSend_mutableBytes(v58, v61, v62, v63) + 8 * i) = 4;
            break;
          default:
            continue;
        }
      }
    }
    objc_msgSend_appendBytes_length_(v58, v61, v40, v48);
    id v65 = v58;
  }
  else
  {
    if (objc_msgSend_geometryType(a3, v52, v53, v54) == 5)
    {
      uint64_t v99 = v23;
      v70 = objc_msgSend_topology(a3, v67, v68, v69);
      v74 = objc_msgSend_faceTopology(v70, v71, v72, v73);
      v78 = objc_msgSend_map(v74, v75, v76, v77);
      uint64_t v82 = objc_msgSend_bytes(v78, v79, v80, v81);
      id v83 = objc_alloc(MEMORY[0x1E4F1CA58]);
      v86 = objc_msgSend_initWithCapacity_(v83, v84, v48 + v28 * v22, v85);
      objc_msgSend_setLength_(v86, v87, v28 * v22, v88);
      if (v22)
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          switch(v28)
          {
            case 1uLL:
              char v93 = *(unsigned char *)(v82 + j);
              *(unsigned char *)(objc_msgSend_mutableBytes(v86, v89, v90, v91) + j) = v93;
              break;
            case 2uLL:
              __int16 v94 = *(unsigned __int8 *)(v82 + j);
              *(_WORD *)(objc_msgSend_mutableBytes(v86, v89, v90, v91) + 2 * j) = v94;
              break;
            case 4uLL:
              int v95 = *(unsigned __int8 *)(v82 + j);
              *(_DWORD *)(objc_msgSend_mutableBytes(v86, v89, v90, v91) + 4 * j) = v95;
              break;
            case 8uLL:
              uint64_t v96 = *(unsigned __int8 *)(v82 + j);
              *(void *)(objc_msgSend_mutableBytes(v86, v89, v90, v91) + 8 * j) = v96;
              break;
            default:
              continue;
          }
        }
      }
      objc_msgSend_appendBytes_length_(v86, v89, v40, v48);
      id v97 = v86;
      uint64_t v23 = v99;
      goto LABEL_38;
    }
    id v65 = (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v67, v40, v48);
  }
  id v97 = v65;
LABEL_38:

  return (id)objc_msgSend_meshElementWithData_primitiveType_primitiveCount_bytesPerIndex_(a1, v66, (uint64_t)v97, v23, v22, v28);
}

@end