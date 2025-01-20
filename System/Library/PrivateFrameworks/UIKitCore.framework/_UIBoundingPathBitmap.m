@interface _UIBoundingPathBitmap
+ (BOOL)supportsSecureCoding;
- (_UIBoundingPathBitmap)boundingPathBitmapWithRect:(_UIIntegralRect *)a3;
- (_UIBoundingPathBitmap)boundingPathBitmapWithRect:(_UIIntegralRect *)a3 cornerRadii:(_UIIntegralCornerRadii *)a4;
- (_UIBoundingPathBitmap)initWithBitmapData:(_UIBoundingPathBitmapData *)a3;
- (_UIBoundingPathBitmap)initWithCoder:(id)a3;
- (_UIBoundingPathBitmap)initWithSize:(_UIIntegralSize)a3 containsPoint:(id)a4;
- (_UIBoundingPathBitmapData)bitmapData;
- (id)_imageRepresentation;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIBoundingPathBitmap

- (_UIBoundingPathBitmapData)bitmapData
{
  _UIBoundingPathBitmapDataSkipRegion v3 = *(_UIBoundingPathBitmapDataSkipRegion *)&self->skipRegion.height;
  *(_OWORD *)&retstr->width = *(_OWORD *)&self->height;
  retstr->skipRegion = v3;
  *(_OWORD *)&retstr->nodeCount = *(_OWORD *)&self->maximumNodesPerRow;
  retstr->rows = (unsigned __int16 *)self[1].width;
  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBoundingPathBitmap)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"nodeCount"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"maximumNodesPerRow"];
  if (v5)
  {
    v23[0] = 0;
    v7 = (const void *)[v4 decodeBytesForKey:@"rows" returnedLength:v23];
    if (!v7)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"_UIBoundingPathBitmapData decodeBitmapDataWithCoder(NSCoder *__strong)"];
      [v16 handleFailureInFunction:v17 file:@"_UIBoundingPathBitmap.m" lineNumber:70 description:@"Failed to decode the bitmap data: decoded bytes are NULL"];
    }
    if (v23[0] != 2 * v5)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = [NSString stringWithUTF8String:"_UIBoundingPathBitmapData decodeBitmapDataWithCoder(NSCoder *__strong)"];
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"_UIBoundingPathBitmap.m", 71, @"Failed to decode the bitmap data: decoded bytes length (%ld) does not equal expected length (%ld)", v23[0], 2 * v5);
    }
    v8 = malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
    if (!v8)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      v21 = objc_msgSend(NSString, "stringWithUTF8String:", "_UIBoundingPathBitmapDataNode *_UIAllocateHostNodeArrayFromDecodedStandardizedEndiannessByteArray(const uint8_t *, const size_t)");
      [v20 handleFailureInFunction:v21 file:@"_UIBoundingPathBitmap.m" lineNumber:50 description:@"Failed to allocate memory for storing the bitmap data node array."];
    }
    memcpy(v8, v7, 2 * v5);
  }
  else
  {
    v8 = 0;
  }
  uint64_t v9 = [v4 decodeIntegerForKey:@"width"];
  uint64_t v10 = [v4 decodeIntegerForKey:@"height"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"skipRegion.y"];
  uint64_t v12 = [v4 decodeIntegerForKey:@"skipRegion.height"];
  if (v5 != (v10 - v12) * v6)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [NSString stringWithUTF8String:"_UIBoundingPathBitmapData decodeBitmapDataWithCoder(NSCoder *__strong)"];
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v22, @"_UIBoundingPathBitmap.m", 81, @"Decoded bitmap data is malformed: width=%ld; height=%lu; skipRegionY=%lu; skipRegionHeight=%lu; nodeCount=%lu; maximumNodesPerRow=%lu",
      v9,
      v10,
      v11,
      v12,
      v5,
      v6);
  }
  v23[0] = v9;
  v23[1] = v10;
  v23[2] = v11;
  v23[3] = v12;
  v23[4] = v5;
  v23[5] = v6;
  v23[6] = v8;
  v13 = [(_UIBoundingPathBitmap *)self initWithBitmapData:v23];

  return v13;
}

- (_UIBoundingPathBitmap)initWithBitmapData:(_UIBoundingPathBitmapData *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIBoundingPathBitmap;
  result = [(_UIBoundingPathBitmap *)&v8 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->width;
    _UIBoundingPathBitmapDataSkipRegion skipRegion = a3->skipRegion;
    long long v7 = *(_OWORD *)&a3->nodeCount;
    result->_bitmapData.rows = a3->rows;
    *(_OWORD *)&result->_bitmapData.nodeCount = v7;
    result->_bitmapData._UIBoundingPathBitmapDataSkipRegion skipRegion = skipRegion;
    *(_OWORD *)&result->_bitmapData.width = v5;
  }
  return result;
}

- (_UIBoundingPathBitmap)boundingPathBitmapWithRect:(_UIIntegralRect *)a3
{
  memset(v7, 0, sizeof(v7));
  _UIIntegralSize var1 = a3->var1;
  v6[0] = a3->var0;
  v6[1] = var1;
  id v4 = [(_UIBoundingPathBitmap *)self boundingPathBitmapWithRect:v6 cornerRadii:v7];
  return (_UIBoundingPathBitmap *)v4;
}

- (_UIBoundingPathBitmap)boundingPathBitmapWithRect:(_UIIntegralRect *)a3 cornerRadii:(_UIIntegralCornerRadii *)a4
{
  unint64_t width = self->_bitmapData.width;
  unint64_t height = self->_bitmapData.height;
  if (a3->var0.var0) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = a3->var1.var0 == width;
  }
  BOOL v7 = v6 && a3->var0.var1 == 0;
  if (v7
    && a3->var1.var1 == height
    && (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(*(int64x2_t *)&a4->var0), (int32x4_t)vceqzq_s64(*(int64x2_t *)&a4->var2))))) & 1) == 0)
  {
    uint64_t v12 = self;
  }
  else
  {
    v23 = 0;
    _UIBoundingPathBitmapDataSkipRegion v21 = (_UIBoundingPathBitmapDataSkipRegion)0;
    long long v22 = 0u;
    long long v20 = 0u;
    *(void *)&long long v16 = width;
    *((void *)&v16 + 1) = height;
    long long v8 = *(_OWORD *)&self->_bitmapData.nodeCount;
    _UIBoundingPathBitmapDataSkipRegion skipRegion = self->_bitmapData.skipRegion;
    long long v18 = v8;
    rows = self->_bitmapData.rows;
    _UIIntegralSize var1 = a3->var1;
    v15[0] = a3->var0;
    v15[1] = var1;
    long long v10 = *(_OWORD *)&a4->var2;
    v14[0] = *(_OWORD *)&a4->var0;
    v14[1] = v10;
    _UIBoundingPathBitmapDataFromDataWithRectAndRadii((uint64_t)&v16, v15, (uint64_t)v14, &v20);
    uint64_t v11 = [_UIBoundingPathBitmap alloc];
    long long v16 = v20;
    _UIBoundingPathBitmapDataSkipRegion skipRegion = v21;
    long long v18 = v22;
    rows = v23;
    uint64_t v12 = [(_UIBoundingPathBitmap *)v11 initWithBitmapData:&v16];
  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeInteger:self->_bitmapData.nodeCount forKey:@"nodeCount"];
  [v10 encodeInteger:self->_bitmapData.maximumNodesPerRow forKey:@"maximumNodesPerRow"];
  unint64_t nodeCount = self->_bitmapData.nodeCount;
  if (nodeCount)
  {
    rows = self->_bitmapData.rows;
    size_t v6 = 2 * nodeCount;
    BOOL v7 = malloc_type_malloc(2 * nodeCount, 0x1000040BDFB0063uLL);
    if (!v7)
    {
      long long v8 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "uint8_t *_UIAllocateStandardizedEndiannessByteArrayForEncodingHostNodeArray(const _UIBoundingPathBitmapDataNode *, const size_t)");
      [v8 handleFailureInFunction:v9 file:@"_UIBoundingPathBitmap.m" lineNumber:34 description:@"Failed to allocate memory for encoding the bitmap data node array."];
    }
    memcpy(v7, rows, v6);
    [v10 encodeBytes:v7 length:2 * self->_bitmapData.nodeCount forKey:@"rows"];
    free(v7);
  }
  [v10 encodeInteger:self->_bitmapData.width forKey:@"width"];
  [v10 encodeInteger:self->_bitmapData.height forKey:@"height"];
  [v10 encodeInteger:self->_bitmapData.skipRegion.y forKey:@"skipRegion.y"];
  [v10 encodeInteger:self->_bitmapData.skipRegion.height forKey:@"skipRegion.height"];
}

- (_UIBoundingPathBitmap)initWithSize:(_UIIntegralSize)a3 containsPoint:(id)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  id v7 = a4;
  unint64_t v8 = _UIComputeSkipRegionForBoundingPathData(var0, var1, v7);
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  _UICreateBoundingPathBitmapData(var0, var1, v8, v9, v7, (unint64_t *)&v13);

  v11[0] = v13;
  v11[1] = v14;
  v11[2] = v15;
  uint64_t v12 = v16;
  return [(_UIBoundingPathBitmap *)self initWithBitmapData:v11];
}

- (void)dealloc
{
  free(self->_bitmapData.rows);
  v3.receiver = self;
  v3.super_class = (Class)_UIBoundingPathBitmap;
  [(_UIBoundingPathBitmap *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  _UIBoundingPathBitmapDataSkipRegion skipRegion = self->_bitmapData.skipRegion;
  v9[0] = *(_OWORD *)&self->_bitmapData.width;
  v9[1] = skipRegion;
  v9[2] = *(_OWORD *)&self->_bitmapData.nodeCount;
  rows = self->_bitmapData.rows;
  size_t v6 = _UIBoundingPathBitmapDataDescription(v9);
  id v7 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v6];

  return v7;
}

- (id)_imageRepresentation
{
  _UIBoundingPathBitmapDataSkipRegion skipRegion = self->_bitmapData.skipRegion;
  v5[0] = *(_OWORD *)&self->_bitmapData.width;
  v5[1] = skipRegion;
  v5[2] = *(_OWORD *)&self->_bitmapData.nodeCount;
  rows = self->_bitmapData.rows;
  objc_super v3 = _UIBoundingPathBitmapDataImageRepresentation((unint64_t *)v5);
  return v3;
}

@end