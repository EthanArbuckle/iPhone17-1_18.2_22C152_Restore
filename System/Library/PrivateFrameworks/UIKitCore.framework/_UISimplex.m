@interface _UISimplex
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSelf;
- (BOOL)isEqual:(id)a3;
- (NSArray)_facets;
- (NSString)description;
- (_UISimplex)initWithCoder:(id)a3;
- (_UISimplex)initWithDimensions:(unint64_t)a3 pointCount:(unint64_t)a4;
- (const)_points;
- (double)_cggetriWorkspace;
- (double)_facetNormalOffsets;
- (double)_facetNormals;
- (double)_incenter;
- (double)_missingNormals;
- (double)_projection;
- (double)_temp;
- (id)copyWithZone:(_NSZone *)a3;
- (int)_cggetriWorkspaceSize;
- (unint64_t)_dimensions;
- (unint64_t)_missingNormalCount;
- (unint64_t)_pointCount;
- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4;
- (void)_mutatePoints:(id)a3;
- (void)_recomputeMetadata;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UISimplex

- (_UISimplex)initWithDimensions:(unint64_t)a3 pointCount:(unint64_t)a4
{
  v19.receiver = self;
  v19.super_class = (Class)_UISimplex;
  v7 = [(_UISimplex *)&v19 init];
  if (v7)
  {
    if (!a3)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2 object:v7 file:@"_UIHyperregion.m" lineNumber:986 description:@"dimensions must be greater than zero"];
    }
    v7->__dimensions = a3;
    v7->__pointCount = a4;
    v7->__points = (double *)malloc_type_calloc(a4 * a3, 8uLL, 0x100004000313F17uLL);
    v8 = (double *)malloc_type_calloc(a3 * a3, 8uLL, 0x100004000313F17uLL);
    unint64_t v9 = a3 - a4 + 1;
    v7->__projection = v8;
    v7->__missingNormalCount = v9;
    v7->__missingNormals = (double *)malloc_type_calloc(v9 * a3, 8uLL, 0x100004000313F17uLL);
    v7->__facetNormals = (double *)malloc_type_calloc(v7->__pointCount * a3, 8uLL, 0x100004000313F17uLL);
    v7->__facetNormalOffsets = (double *)malloc_type_calloc(v7->__pointCount, 8uLL, 0x100004000313F17uLL);
    if (a4 >= 2)
    {
      v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v7->__pointCount)
      {
        unint64_t v11 = 0;
        do
        {
          v12 = [[_UISimplex alloc] initWithDimensions:a3 pointCount:a4 - 1];
          [(NSArray *)v10 addObject:v12];

          ++v11;
        }
        while (v11 < v7->__pointCount);
      }
      facets = v7->__facets;
      v7->__facets = v10;
    }
    int v14 = LODWORD(v7->__pointCount) - 1;
    int v15 = ilaenv_NEWLAPACK();
    v7->__cggetriWorkspaceSize = v15 * v14;
    v7->__cggetriWorkspace = (double *)malloc_type_calloc(v15 * v14, 8uLL, 0x100004000313F17uLL);
    if (a3 <= a4) {
      unint64_t v16 = a4;
    }
    else {
      unint64_t v16 = a3;
    }
    v7->__temp = (double *)malloc_type_calloc(v16 * v16, 8uLL, 0x100004000313F17uLL);
  }
  return v7;
}

- (void)dealloc
{
  free(self->__points);
  free(self->__projection);
  free(self->__missingNormals);
  free(self->__facetNormals);
  free(self->__facetNormalOffsets);
  free(self->__cggetriWorkspace);
  free(self->__temp);
  v3.receiver = self;
  v3.super_class = (Class)_UISimplex;
  [(_UISimplex *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = _UIMatrixDescription((uint64_t)self->__points, self->__dimensions, self->__pointCount);
  v6 = [v3 stringWithFormat:@"<%@: %p points = %@>", v4, self, v5];;

  return (NSString *)v6;
}

- (void)_recomputeMetadata
{
  if (self->__pointCount != 1)
  {
    unint64_t v3 = 0;
    do
    {
      vDSP_Length dimensions = self->__dimensions;
      v5 = &self->__temp[dimensions * v3++];
      vDSP_vsubD(self->__points, 1, &self->__points[dimensions * v3], 1, v5, 1, dimensions);
      unint64_t pointCount = self->__pointCount;
    }
    while (v3 < pointCount - 1);
    if (pointCount > 1 && pointCount - 1 < self->__dimensions) {
      _UIHyperProjectionMatrixForBasis((uint64_t)self->__projection);
    }
  }
  catlas_dset_NEWLAPACK();
  catlas_dset_NEWLAPACK();
  catlas_dset_NEWLAPACK();
  _UIHyperKernelBasis((uint64_t)self->__temp);
  catlas_dset_NEWLAPACK();
  catlas_dset_NEWLAPACK();
  if (self->__pointCount)
  {
    uint64_t v7 = 0;
    do
    {
      cblas_dcopy_NEWLAPACK();
      v8 = &self->__temp[self->__dimensions * self->__missingNormalCount];
      cblas_dcopy_NEWLAPACK();
      unint64_t v9 = v7 + 1;
      cblas_dcopy_NEWLAPACK();
      unint64_t v10 = self->__pointCount;
      if (v10 != 1)
      {
        unint64_t v11 = 0;
        unint64_t v12 = v10 - 2;
        do
        {
          vDSP_vsubD(&v8[self->__dimensions * v12], 1, &v8[self->__dimensions * v11], 1, &v8[self->__dimensions * v11], 1, self->__dimensions);
          ++v11;
        }
        while (v11 < self->__pointCount - 1);
      }
      v13 = &self->__facetNormals[self->__dimensions * v7];
      _UIHyperKernelBasis((uint64_t)self->__temp);
      vDSP_Length v14 = self->__dimensions;
      int v15 = &self->__points[v9 % self->__pointCount * v14];
      double __C = 0.0;
      vDSP_dotprD(v13, 1, v15, 1, &__C, v14);
      self->__facetNormalOffsets[v7] = __C;
      vDSP_Length v16 = self->__dimensions;
      v17 = &self->__points[v16 * v7];
      double __C = 0.0;
      vDSP_dotprD(v13, 1, v17, 1, &__C, v16);
      double v18 = __C;
      if (__C > self->__facetNormalOffsets[v7])
      {
        vDSP_Length v19 = self->__dimensions;
        double __C = -1.0;
        vDSP_vsmulD(v13, 1, &__C, v13, 1, v19);
        facetNormalOffsets = self->__facetNormalOffsets;
        double v18 = -facetNormalOffsets[v7];
        facetNormalOffsets[v7] = v18;
      }
      unint64_t v21 = self->__pointCount;
      ++v7;
    }
    while (v9 < v21);
    if (v21 && self->__facets)
    {
      unint64_t v22 = 0;
      do
      {
        v23 = -[NSArray objectAtIndexedSubscript:](self->__facets, "objectAtIndexedSubscript:", v22, v18);
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __32___UISimplex__recomputeMetadata__block_invoke;
        v24[3] = &unk_1E52DC2B8;
        v24[4] = self;
        v24[5] = v22;
        [v23 _mutatePoints:v24];

        ++v22;
      }
      while (v22 < self->__pointCount);
    }
  }
  *(unsigned char *)&self->_clean |= 1u;
}

- (const)_points
{
  return self->__points;
}

- (void)_mutatePoints:(id)a3
{
  uint64_t v4 = (void (**)(id, double *))a3;
  [(_UISimplex *)self willChangeValueForKey:@"_points"];
  v4[2](v4, self->__points);

  *(unsigned char *)&self->_clean &= ~1u;
  [(_UISimplex *)self didChangeValueForKey:@"_points"];
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  if ((*(unsigned char *)&self->_clean & 1) == 0) {
    [(_UISimplex *)self _recomputeMetadata];
  }
  if (self->__pointCount >= 2)
  {
    unint64_t v7 = 0;
    while (1)
    {
      vDSP_Length dimensions = self->__dimensions;
      unint64_t v9 = &self->__facetNormals[dimensions * v7];
      double __C = 0.0;
      vDSP_dotprD(v9, 1, a4, 1, &__C, dimensions);
      if (__C > self->__facetNormalOffsets[v7]) {
        break;
      }
      ++v7;
      unint64_t pointCount = self->__pointCount;
      if (v7 >= pointCount)
      {
        vDSP_Length v11 = self->__dimensions;
        if (pointCount - 1 >= v11)
        {
          cblas_dcopy_NEWLAPACK();
        }
        else
        {
          vDSP_vsubD(self->__points, 1, a4, 1, a3, 1, v11);
          cblas_dgemv_NEWLAPACK();
          points = self->__points;
          vDSP_Length v13 = self->__dimensions;
          vDSP_vaddD(a3, 1, points, 1, a3, 1, v13);
        }
        return;
      }
    }
  }
  cblas_dcopy_NEWLAPACK();
  if (self->__facets && self->__pointCount)
  {
    unint64_t v14 = 0;
    double v15 = INFINITY;
    do
    {
      vDSP_Length v16 = [(NSArray *)self->__facets objectAtIndexedSubscript:v14];
      [v16 _closestPoint:self->__temp toPoint:a4];
      temp = self->__temp;
      vDSP_Length v18 = self->__dimensions;
      double __C = 0.0;
      vDSP_distancesqD(a4, 1, temp, 1, &__C, v18);
      double v19 = sqrt(__C);
      if (v19 < v15)
      {
        cblas_dcopy_NEWLAPACK();
        double v15 = v19;
      }

      ++v14;
    }
    while (v14 < self->__pointCount);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISimplex)initWithCoder:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [v5 decodeIntegerForKey:@"_pointCount"];
  unint64_t v12 = 0;
  unint64_t v7 = objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", @"_points", &v12);

  unint64_t v8 = v12;
  if (v12 % v6)
  {
    vDSP_Length v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIHyperregion.m", 1213, @"Decoded pointCount (%lu) is of unexpected size", v6);

    unint64_t v8 = v12;
  }
  unint64_t v9 = [(_UISimplex *)self initWithDimensions:v8 / v6 pointCount:v6];
  [(_UISimplex *)v9 _mutatePoints:v7];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t pointCount = self->__pointCount;
  id v5 = a3;
  [v5 encodeInteger:pointCount forKey:@"_pointCount"];
  objc_msgSend(v5, "_ui_encodeVector:count:forKey:", self->__points, self->__pointCount * self->__dimensions, @"_points");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[_UISimplex alloc] initWithDimensions:[(_UISimplex *)self _dimensions] pointCount:[(_UISimplex *)self _pointCount]];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27___UISimplex_copyWithZone___block_invoke;
  v6[3] = &unk_1E52DB3A0;
  v6[4] = self;
  [(_UISimplex *)v4 _mutatePoints:v6];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UISimplex *)self _dimensions];
    BOOL v8 = v6 == [v5 _dimensions]
      && (unint64_t v7 = -[_UISimplex _pointCount](self, "_pointCount"), v7 == [v5 _pointCount])
      && memcmp(-[_UISimplex _points](self, "_points"), (const void *)[v5 _points], 8 * -[_UISimplex _dimensions](self, "_dimensions") * -[_UISimplex _pointCount](self, "_pointCount")) == 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"_points"];
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (unint64_t)_pointCount
{
  return self->__pointCount;
}

- (double)_projection
{
  return self->__projection;
}

- (unint64_t)_missingNormalCount
{
  return self->__missingNormalCount;
}

- (double)_missingNormals
{
  return self->__missingNormals;
}

- (double)_facetNormals
{
  return self->__facetNormals;
}

- (double)_facetNormalOffsets
{
  return self->__facetNormalOffsets;
}

- (double)_incenter
{
  return self->__incenter;
}

- (NSArray)_facets
{
  return self->__facets;
}

- (int)_cggetriWorkspaceSize
{
  return self->__cggetriWorkspaceSize;
}

- (double)_cggetriWorkspace
{
  return self->__cggetriWorkspace;
}

- (double)_temp
{
  return self->__temp;
}

- (void).cxx_destruct
{
}

@end