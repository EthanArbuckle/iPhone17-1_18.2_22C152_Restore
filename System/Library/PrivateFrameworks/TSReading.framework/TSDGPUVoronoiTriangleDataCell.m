@interface TSDGPUVoronoiTriangleDataCell
- ($94F468A8D4C62B317260615823C2B210)centerPoint;
- ($94F468A8D4C62B317260615823C2B210)vertexData;
- (CGRect)bounds;
- (TSDGPUVoronoiTriangleDataCell)initWithEdges:()vector<boost:(std::allocator<boost::polygon::segment_data<double>>> *)a3 :polygon::segment_data<double>;
- (TSDGPUVoronoiTriangleDataCell)initWithTrianglePoints:(id *)a3;
- (id)cellsBySplittingCellIntoTriangles;
- (unint64_t)triangleCount;
- (unint64_t)vertexCount;
- (void)dealloc;
- (void)p_setupTriangleDataWithEdges:()vector<boost:(std::allocator<boost::polygon::segment_data<double>>> *)a3 :polygon::segment_data<double>;
@end

@implementation TSDGPUVoronoiTriangleDataCell

- (void)p_setupTriangleDataWithEdges:()vector<boost:(std::allocator<boost::polygon::segment_data<double>>> *)a3 :polygon::segment_data<double>
{
  int64_t v5 = (char *)a3->var1 - (char *)a3->var0;
  size_t v6 = v5 >> 5;
  if ((unint64_t)v5 <= 0x40)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDGPUVoronoiTriangleDataCell p_setupTriangleDataWithEdges:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 351, @"Less than 3 edges in this cell!");
  }
  v9 = (float32x2_t *)malloc_type_calloc(8uLL, v6, 0xCC049D6BuLL);
  v10 = v9;
  var0 = (float64x2_t *)a3->var0;
  var1 = a3->var1;
  if (a3->var0 == var1)
  {
    double v16 = 1.79769313e308;
    double v13 = 2.22507386e-308;
    double v14 = 1.79769313e308;
  }
  else
  {
    double v13 = 2.22507386e-308;
    double v14 = 1.79769313e308;
    v15 = v9;
    double v16 = 1.79769313e308;
    double v17 = 2.22507386e-308;
    do
    {
      float64x2_t v18 = *var0;
      var0 += 2;
      float32x2_t v19 = vcvt_f32_f64(v18);
      *v15++ = v19;
      double v20 = v19.f32[0];
      if (v14 >= v19.f32[0]) {
        double v14 = v19.f32[0];
      }
      double v21 = v19.f32[1];
      if (v16 >= v21) {
        double v16 = v21;
      }
      if (v13 <= v20) {
        double v13 = v20;
      }
      if (v17 <= v21) {
        double v17 = v21;
      }
    }
    while (var0 != (float64x2_t *)var1);
  }
  unint64_t v22 = 3 * (v6 - 2);
  self->_triangleCount = v6 - 2;
  self->_vertexCount = v22;
  v23 = (char *)malloc_type_calloc(8uLL, v22, 0x44490DFAuLL);
  v24 = ($94F468A8D4C62B317260615823C2B210 *)v23;
  if ((uint64_t)self->_triangleCount >= 1)
  {
    uint64_t v25 = 0;
    int64_t v26 = 0;
    size_t v27 = v6 - 1;
    v28 = (float32x2_t *)(v23 + 16);
    char v29 = 1;
    do
    {
      float32x2_t v30 = v10[v25];
      if (v29) {
        float32x2_t v31 = v10[v27];
      }
      else {
        float32x2_t v31 = v10[v25];
      }
      if (v29)
      {
        size_t v32 = v25 + 1;
      }
      else
      {
        float32x2_t v30 = v10[v27];
        size_t v32 = v27 - 1;
      }
      if (v29) {
        ++v25;
      }
      else {
        --v27;
      }
      float32x2_t v33 = v10[v32];
      v28[-2] = v30;
      v28[-1] = v31;
      float32x2_t *v28 = v33;
      v28 += 3;
      v29 ^= 1u;
      ++v26;
    }
    while (v26 < (int64_t)self->_triangleCount);
  }
  vertexData = self->_vertexData;
  if (vertexData) {
    free(vertexData);
  }
  self->_vertexData = v24;
  double v35 = TSDRectWithPoints(v14, v16, v13);
  self->_bounds.origin.x = v35;
  self->_bounds.origin.y = v36;
  self->_bounds.size.width = v37;
  self->_bounds.size.height = v38;
  float v39 = TSDCenterOfRect(v35, v36, v37, v38);
  *(float *)&double v40 = v40;
  self->_centerPoint.x = v39;
  self->_centerPoint.y = *(float *)&v40;

  free(v10);
}

- (id)cellsBySplittingCellIntoTriangles
{
  v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[TSDGPUVoronoiTriangleDataCell triangleCount](self, "triangleCount"));
  if ([(TSDGPUVoronoiTriangleDataCell *)self triangleCount])
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      size_t v6 = [[TSDGPUVoronoiTriangleDataCell alloc] initWithTrianglePoints:&self->_vertexData[v4]];
      [v3 addObject:v6];

      ++v5;
      v4 += 3;
    }
    while (v5 < [(TSDGPUVoronoiTriangleDataCell *)self triangleCount]);
  }
  return v3;
}

- (TSDGPUVoronoiTriangleDataCell)initWithEdges:()vector<boost:(std::allocator<boost::polygon::segment_data<double>>> *)a3 :polygon::segment_data<double>
{
  v9.receiver = self;
  v9.super_class = (Class)TSDGPUVoronoiTriangleDataCell;
  uint64_t v4 = [(TSDGPUVoronoiTriangleDataCell *)&v9 init];
  if (v4)
  {
    __p = 0;
    v7 = 0;
    uint64_t v8 = 0;
    std::vector<boost::polygon::segment_data<double>>::__init_with_size[abi:ne180100]<boost::polygon::segment_data<double>*,boost::polygon::segment_data<double>*>((char *)&__p, a3->var0, (void *)a3->var1, ((char *)a3->var1 - (char *)a3->var0) >> 5);
    [(TSDGPUVoronoiTriangleDataCell *)v4 p_setupTriangleDataWithEdges:&__p];
    if (__p)
    {
      v7 = __p;
      operator delete(__p);
    }
  }
  return v4;
}

- (TSDGPUVoronoiTriangleDataCell)initWithTrianglePoints:(id *)a3
{
  if (!a3)
  {
    unint64_t v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDGPUVoronoiTriangleDataCell initWithTrianglePoints:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGPUVoronoiTriangleData.mm"), 459, @"points is NULL!");
  }
  v25.receiver = self;
  v25.super_class = (Class)TSDGPUVoronoiTriangleDataCell;
  v7 = [(TSDGPUVoronoiTriangleDataCell *)&v25 init];
  uint64_t v8 = (TSDGPUVoronoiTriangleDataCell *)v7;
  if (v7)
  {
    *(_OWORD *)(v7 + 8) = xmmword_22383A530;
    *((void *)v7 + 3) = malloc_type_calloc(8uLL, 3uLL, 0x67546D9DuLL);
    if (!v8->_vertexCount) {
      goto LABEL_19;
    }
    unint64_t v9 = 0;
    do
    {
      v8->_vertexData[v9] = a3[v9];
      ++v9;
      unint64_t vertexCount = v8->_vertexCount;
    }
    while (v9 < vertexCount);
    if (vertexCount)
    {
      p_var1 = &v8->_vertexData->var1;
      double v12 = 2.22507386e-308;
      double v13 = 1.79769313e308;
      double v14 = 1.79769313e308;
      double v15 = 2.22507386e-308;
      do
      {
        double v16 = *(p_var1 - 1);
        if (v13 >= v16) {
          double v13 = *(p_var1 - 1);
        }
        double v17 = *p_var1;
        if (v14 >= v17) {
          double v14 = *p_var1;
        }
        if (v12 <= v16) {
          double v12 = *(p_var1 - 1);
        }
        if (v15 <= v17) {
          double v15 = *p_var1;
        }
        p_var1 += 2;
        --vertexCount;
      }
      while (vertexCount);
    }
    else
    {
LABEL_19:
      double v14 = 1.79769313e308;
      double v12 = 2.22507386e-308;
      double v13 = 1.79769313e308;
    }
    double v18 = TSDRectWithPoints(v13, v14, v12);
    v8->_bounds.origin.x = v18;
    v8->_bounds.origin.y = v19;
    v8->_bounds.size.width = v20;
    v8->_bounds.size.height = v21;
    float v22 = TSDCenterOfRect(v18, v19, v20, v21);
    *(float *)&double v23 = v23;
    v8->_centerPoint.x = v22;
    v8->_centerPoint.y = *(float *)&v23;
  }
  return v8;
}

- (void)dealloc
{
  vertexData = self->_vertexData;
  if (vertexData)
  {
    free(vertexData);
    self->_vertexData = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSDGPUVoronoiTriangleDataCell;
  [(TSDGPUVoronoiTriangleDataCell *)&v4 dealloc];
}

- (unint64_t)triangleCount
{
  return self->_triangleCount;
}

- (unint64_t)vertexCount
{
  return self->_vertexCount;
}

- ($94F468A8D4C62B317260615823C2B210)vertexData
{
  return self->_vertexData;
}

- ($94F468A8D4C62B317260615823C2B210)centerPoint
{
  float x = self->_centerPoint.x;
  float y = self->_centerPoint.y;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end