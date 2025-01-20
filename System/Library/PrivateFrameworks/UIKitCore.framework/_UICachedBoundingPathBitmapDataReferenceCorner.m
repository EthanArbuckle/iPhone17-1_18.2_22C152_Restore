@interface _UICachedBoundingPathBitmapDataReferenceCorner
+ (BOOL)supportsSecureCoding;
+ (id)cachedReferenceCornerForRadius:(int64_t)a3;
- (_UIBoundingPathBitmapDataCorner)referenceCornerCopy;
- (_UICachedBoundingPathBitmapDataReferenceCorner)initWithCoder:(id)a3;
- (_UICachedBoundingPathBitmapDataReferenceCorner)initWithReferenceCorner:(_UIBoundingPathBitmapDataCorner *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UICachedBoundingPathBitmapDataReferenceCorner

+ (id)cachedReferenceCornerForRadius:(int64_t)a3
{
  v4 = (void *)__cachedReferenceCornersByRadius;
  v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  v6 = [v4 objectForKey:v5];

  if (!v6)
  {
    if (!__cachedReferenceCornersByRadius)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      v8 = (void *)__cachedReferenceCornersByRadius;
      __cachedReferenceCornersByRadius = (uint64_t)v7;
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
    _UIBoundingPathBitmapDataCreateReferenceCornerWithRadius(a3, (uint64_t)&v14);
    v9 = [_UICachedBoundingPathBitmapDataReferenceCorner alloc];
    v13[0] = v14;
    v13[1] = v15;
    v13[2] = v16;
    v6 = [(_UICachedBoundingPathBitmapDataReferenceCorner *)v9 initWithReferenceCorner:v13];
    v10 = (void *)__cachedReferenceCornersByRadius;
    v11 = [NSNumber numberWithInteger:a3];
    [v10 setObject:v6 forKey:v11];
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICachedBoundingPathBitmapDataReferenceCorner)initWithReferenceCorner:(_UIBoundingPathBitmapDataCorner *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UICachedBoundingPathBitmapDataReferenceCorner;
  v5 = [(_UICachedBoundingPathBitmapDataReferenceCorner *)&v12 init];
  if (v5)
  {
    if (a3->location)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      [v9 handleFailureInMethod:a2, v5, @"_UIBoundingPathBitmapDataCornerCache.m", 161, @"%@ should only be used to cache reference corners", v11 object file lineNumber description];
    }
    long long v6 = *(_OWORD *)&a3->location;
    long long v7 = *(_OWORD *)&a3->size;
    *(_OWORD *)(v5 + 40) = *(_OWORD *)&a3->referenceEdgePositionsByRow;
    *(_OWORD *)(v5 + 24) = v7;
    *(_OWORD *)(v5 + 8) = v6;
  }
  return (_UICachedBoundingPathBitmapDataReferenceCorner *)v5;
}

- (_UICachedBoundingPathBitmapDataReferenceCorner)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"radius"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"size"];
  char v7 = [v4 decodeBoolForKey:@"edgePositionsUseLargeValues"];
  uint64_t v8 = v6 << v7;
  if (v6 << v7)
  {
    v24[0] = 0;
    id v9 = v4;
    v10 = (const void *)[v9 decodeBytesForKey:@"referenceEdgePositionsByRow" returnedLength:v24];
    if (!v10)
    {
      long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
      v17 = [NSString stringWithUTF8String:"_UIBoundingPathBitmapDataCorner _decodeReferenceCornerFromCoder(NSCoder *__strong)"];
      [v16 handleFailureInFunction:v17 file:@"_UIBoundingPathBitmapDataCornerCache.m" lineNumber:110 description:@"Failed to decode the bitmap data corner: decoded row bytes are NULL"];
    }
    if (v24[0] != v8)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      v19 = [NSString stringWithUTF8String:"_UIBoundingPathBitmapDataCorner _decodeReferenceCornerFromCoder(NSCoder *__strong)"];
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, @"_UIBoundingPathBitmapDataCornerCache.m", 111, @"Failed to decode the bitmap data corner: decoded row bytes length (%ld) does not equal expected length (%ld)", v24[0], v8);
    }
    HostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray = _allocateHostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray(v10, v6, v7);
    objc_super v12 = HostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray;
    if ([v9 containsValueForKey:@"referenceEdgePositionsByCol"])
    {
      uint64_t v29 = 0;
      v13 = (const void *)[v9 decodeBytesForKey:@"referenceEdgePositionsByCol" returnedLength:&v29];
      if (!v13)
      {
        v20 = [MEMORY[0x1E4F28B00] currentHandler];
        v21 = [NSString stringWithUTF8String:"_UIBoundingPathBitmapDataCorner _decodeReferenceCornerFromCoder(NSCoder *__strong)"];
        [v20 handleFailureInFunction:v21 file:@"_UIBoundingPathBitmapDataCornerCache.m" lineNumber:119 description:@"Failed to decode the bitmap data corner: decoded col bytes are NULL"];
      }
      if (v29 != v8)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        v23 = [NSString stringWithUTF8String:"_UIBoundingPathBitmapDataCorner _decodeReferenceCornerFromCoder(NSCoder *__strong)"];
        objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"_UIBoundingPathBitmapDataCornerCache.m", 120, @"Failed to decode the bitmap data corner: decoded col bytes length (%ld) does not equal expected length (%ld)", v29, v8);
      }
      objc_super v12 = _allocateHostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray(v13, v6, v7);
    }
  }
  else
  {
    HostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray = 0;
    objc_super v12 = 0;
  }

  v24[0] = 0;
  v24[1] = v5;
  v24[2] = v6;
  char v25 = v7;
  memset(v26, 0, sizeof(v26));
  v27 = HostReferenceEdgePositionsFromDecodedStandardizedEndiannessByteArray;
  v28 = v12;
  long long v14 = [(_UICachedBoundingPathBitmapDataReferenceCorner *)self initWithReferenceCorner:v24];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t location = self->_referenceCorner.location;
  unint64_t radius = self->_referenceCorner.radius;
  unint64_t size = self->_referenceCorner.size;
  int edgePositionsUseLargeValues = self->_referenceCorner.edgePositionsUseLargeValues;
  referenceEdgePositionsByRow = self->_referenceCorner.referenceEdgePositionsByRow;
  referenceEdgePositionsByCol = self->_referenceCorner.referenceEdgePositionsByCol;
  id v11 = v4;
  id v17 = v11;
  if (location)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v16 = objc_msgSend(NSString, "stringWithUTF8String:", "void _encodeReferenceCornerWithCoder(const _UIBoundingPathBitmapDataCorner, NSCoder *__strong)");
    [v15 handleFailureInFunction:v16 file:@"_UIBoundingPathBitmapDataCornerCache.m" lineNumber:130 description:@"Only reference corners can be encoded as data."];

    id v11 = v17;
  }
  [v11 encodeInteger:radius forKey:@"radius"];
  [v17 encodeInteger:size forKey:@"size"];
  [v17 encodeBool:edgePositionsUseLargeValues != 0 forKey:@"edgePositionsUseLargeValues"];
  unint64_t v12 = size << edgePositionsUseLargeValues;
  if (size << edgePositionsUseLargeValues)
  {
    StandardizedEndiannessByteArrayForEncodingHostReferenceEdgePositions = _allocateStandardizedEndiannessByteArrayForEncodingHostReferenceEdgePositions(referenceEdgePositionsByRow, size, edgePositionsUseLargeValues != 0);
    [v17 encodeBytes:StandardizedEndiannessByteArrayForEncodingHostReferenceEdgePositions length:size << edgePositionsUseLargeValues forKey:@"referenceEdgePositionsByRow"];
    free(StandardizedEndiannessByteArrayForEncodingHostReferenceEdgePositions);
    if (referenceEdgePositionsByRow != referenceEdgePositionsByCol)
    {
      long long v14 = _allocateStandardizedEndiannessByteArrayForEncodingHostReferenceEdgePositions(referenceEdgePositionsByCol, size, edgePositionsUseLargeValues != 0);
      [v17 encodeBytes:v14 length:v12 forKey:@"referenceEdgePositionsByCol"];
      free(v14);
    }
  }
}

- (_UIBoundingPathBitmapDataCorner)referenceCornerCopy
{
  long long v4 = *(_OWORD *)&self->radius;
  unint64_t v5 = *(void *)&self->edgePositionsUseLargeValues;
  char referenceEdgePositionsByRow = (char)self->referenceEdgePositionsByRow;
  if (v5 << referenceEdgePositionsByRow)
  {
    long long v11 = *(_OWORD *)&self->radius;
    referenceEdgePositionsByCol = self->referenceEdgePositionsByCol;
    unint64_t location = (const void *)self[1].location;
    id v9 = malloc_type_malloc(v5 << referenceEdgePositionsByRow, 0xEEEA5B69uLL);
    self = (_UIBoundingPathBitmapDataCorner *)memcpy(v9, referenceEdgePositionsByCol, v5 << referenceEdgePositionsByRow);
    if (referenceEdgePositionsByCol == location)
    {
      v10 = v9;
    }
    else
    {
      v10 = malloc_type_malloc(v5 << referenceEdgePositionsByRow, 0x6D775E6uLL);
      self = (_UIBoundingPathBitmapDataCorner *)memcpy(v10, location, v5 << referenceEdgePositionsByRow);
    }
    long long v4 = v11;
  }
  else
  {
    id v9 = 0;
    v10 = 0;
  }
  *(_OWORD *)&retstr->unint64_t location = v4;
  retstr->unint64_t size = v5;
  retstr->int edgePositionsUseLargeValues = referenceEdgePositionsByRow;
  retstr->char referenceEdgePositionsByRow = v9;
  retstr->referenceEdgePositionsByCol = v10;
  return self;
}

- (void)dealloc
{
  long long v3 = *(_OWORD *)&self->_referenceCorner.size;
  v5[0] = *(_OWORD *)&self->_referenceCorner.location;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&self->_referenceCorner.referenceEdgePositionsByRow;
  _UIBoundingPathBitmapDataDestroyCorner((uint64_t)v5);
  v4.receiver = self;
  v4.super_class = (Class)_UICachedBoundingPathBitmapDataReferenceCorner;
  [(_UICachedBoundingPathBitmapDataReferenceCorner *)&v4 dealloc];
}

@end