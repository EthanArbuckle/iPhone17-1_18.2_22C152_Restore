@interface VKSnapshotElevationRaster
+ (BOOL)supportsSecureCoding;
- (NSData)rasterData;
- (VKSnapshotElevationRaster)initWithCoder:(id)a3;
- (VKSnapshotElevationRaster)initWithQuadTile:(QuadTile *)a3 width:(int)a4 height:(int)a5 scale:(float)a6 tileSizeInMeters:(float)a7 minElevationInMeters:(signed __int16)a8;
- (const)tile;
- (float)_rasterElevationInMetersAtPoint:()Matrix<int;
- (float)getElevationAtPoint:(const void *)a3;
- (float)scale;
- (float)tileSizeInMeters;
- (id).cxx_construct;
- (int)height;
- (int)width;
- (signed)minElevationInMeters;
- (void)encodeWithCoder:(id)a3;
- (void)setRasterData:(id)a3;
@end

@implementation VKSnapshotElevationRaster

- (id).cxx_construct
{
  *((_WORD *)self + 4) = 255;
  *((_DWORD *)self + 3) = 0;
  *((_DWORD *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (const)tile
{
  return &self->_tile;
}

- (void)setRasterData:(id)a3
{
}

- (NSData)rasterData
{
  return self->_rasterData;
}

- (signed)minElevationInMeters
{
  return self->_minElevationInMeters;
}

- (float)tileSizeInMeters
{
  return self->_tileSizeInMeters;
}

- (float)scale
{
  return self->_scale;
}

- (int)height
{
  return self->_height;
}

- (int)width
{
  return self->_width;
}

- (float)getElevationAtPoint:(const void *)a3
{
  float v4 = *(double *)a3;
  float v5 = 1.0 - *((double *)a3 + 1);
  float v6 = (float)(self->_width - 1) * v4;
  float v7 = (float)(self->_height - 1) * v5;
  uint64_t v8 = (int)v7;
  [(VKSnapshotElevationRaster *)self _rasterElevationInMetersAtPoint:(int)v6 | ((unint64_t)v8 << 32)];
  float v10 = v9;
  uint64_t v11 = ((int)v6 + 1);
  [(VKSnapshotElevationRaster *)self _rasterElevationInMetersAtPoint:v11 | (v8 << 32)];
  float v13 = v12;
  uint64_t v14 = (v8 + 1);
  [(VKSnapshotElevationRaster *)self _rasterElevationInMetersAtPoint:(int)v6 | ((unint64_t)v14 << 32)];
  float v16 = v15;
  [(VKSnapshotElevationRaster *)self _rasterElevationInMetersAtPoint:v11 | (v14 << 32)];
  float v17 = v6 - truncf(v6);
  return (float)((float)(v10 * (float)(1.0 - v17)) + (float)(v13 * v17))
       + (float)((float)(v7 - truncf(v7))
               * (float)((float)((float)(v16 * (float)(1.0 - v17)) + (float)(v18 * v17))
                       - (float)((float)(v10 * (float)(1.0 - v17)) + (float)(v13 * v17))));
}

- (float)_rasterElevationInMetersAtPoint:()Matrix<int
{
  int v4 = a3._e[1];
  int width = self->_width;
  int v6 = width - 1;
  if (width - 1 >= a3._e[0]) {
    int v6 = a3._e[0];
  }
  if (a3._e[0] < 0) {
    int v6 = 0;
  }
  if (self->_height - 1 < a3._e[1]) {
    int v4 = self->_height - 1;
  }
  if (*(uint64_t *)&a3 < 0) {
    int v4 = 0;
  }
  NSUInteger v7 = v6 + v4 * width;
  uint64_t v8 = [(NSData *)self->_rasterData bytes];
  NSUInteger v9 = [(NSData *)self->_rasterData length];
  float v11 = 0.0;
  if (v9 >= v7)
  {
    LOWORD(v11) = v8[v7];
    float v11 = (float)LODWORD(v11);
  }
  v10.i16[0] = self->_minElevationInMeters;
  return (float)vmovl_s16(v10).i32[0] + (float)(self->_scale * v11);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  float v5 = v4;
  if (self->_rasterData)
  {
    [v4 encodeInt32:self->_width forKey:@"width"];
    [v5 encodeInt32:self->_height forKey:@"height"];
    *(float *)&double v6 = self->_scale;
    [v5 encodeFloat:@"scale" forKey:v6];
    *(float *)&double v7 = self->_tileSizeInMeters;
    [v5 encodeFloat:@"tileSizeInMeters" forKey:v7];
    unsigned __int8 level = self->_tile._level;
    int32x2_t v10 = vrev64_s32(*(int32x2_t *)&self->_tile._yIdx);
    unsigned __int8 v11 = level;
    NSUInteger v9 = [MEMORY[0x1E4F29238] value:&v10 withObjCType:"{QuadTileCoding=iiC}"];
    [v5 encodeObject:v9 forKey:@"quadTile"];

    [v5 encodeInt:self->_minElevationInMeters forKey:@"minElevationInMeters"];
    [v5 encodeObject:self->_rasterData forKey:@"rasterData"];
  }
}

- (VKSnapshotElevationRaster)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VKSnapshotElevationRaster;
  float v5 = [(VKSnapshotElevationRaster *)&v16 init];
  if (v5)
  {
    *((_DWORD *)v5 + 8) = [v4 decodeInt32ForKey:@"width"];
    *((_DWORD *)v5 + 9) = [v4 decodeInt32ForKey:@"height"];
    [v4 decodeFloatForKey:@"scale"];
    *((_DWORD *)v5 + 11) = v6;
    [v4 decodeFloatForKey:@"tileSizeInMeters"];
    *((_DWORD *)v5 + 12) = v7;
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"quadTile"];
    if (!strcmp((const char *)[v8 objCType], "{QuadTileCoding=iiC}"))
    {
      char v15 = 0;
      int32x2_t v14 = 0;
      [v8 getValue:&v14];
      char v9 = v15;
      v5[8] = -1;
      v5[9] = v9;
      *(int32x2_t *)(v5 + 12) = vrev64_s32(v14);
    }
    *((_WORD *)v5 + 26) = [v4 decodeIntForKey:@"minElevationInMeters"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rasterData"];
    unsigned __int8 v11 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v10;

    float v12 = v5;
  }

  return (VKSnapshotElevationRaster *)v5;
}

- (VKSnapshotElevationRaster)initWithQuadTile:(QuadTile *)a3 width:(int)a4 height:(int)a5 scale:(float)a6 tileSizeInMeters:(float)a7 minElevationInMeters:(signed __int16)a8
{
  v16.receiver = self;
  v16.super_class = (Class)VKSnapshotElevationRaster;
  result = [(VKSnapshotElevationRaster *)&v16 init];
  if (result)
  {
    long long v15 = *(_OWORD *)&a3->_type;
    result->_tile._hash = a3->_hash;
    *(_OWORD *)&result->_tile._type = v15;
    result->_int width = a4;
    result->_height = a5;
    result->_scale = a6;
    result->_tileSizeInMeters = a7;
    result->_minElevationInMeters = a8;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end