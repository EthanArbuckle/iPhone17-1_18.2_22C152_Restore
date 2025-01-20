@interface _UIHyperregionUnion
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSelf;
- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)_regions;
- (NSString)description;
- (_UIHyperregionUnion)initWithCoder:(id)a3;
- (_UIHyperregionUnion)initWithDimensions:(unint64_t)a3;
- (double)_temp;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (unint64_t)_regionIndexForClosestPoint:(double *)a3 toPoint:(const double *)a4;
- (void)_setRegions:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _UIHyperregionUnion

- (_UIHyperregionUnion)initWithDimensions:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIHyperregionUnion;
  v4 = [(_UIHyperregionUnion *)&v9 init];
  v5 = v4;
  if (v4)
  {
    regions = v4->__regions;
    v7 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v4->__dimensions = a3;
    v4->__regions = v7;

    v5->__temp = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)dealloc
{
  regions = self->__regions;
  v4 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[NSArray count](regions, "count"));
  [(NSArray *)regions removeObserver:self fromObjectsAtIndexes:v4 forKeyPath:@"self" context:_UIHyperregionUnionRegionsObservationContext];

  free(self->__temp);
  v5.receiver = self;
  v5.super_class = (Class)_UIHyperregionUnion;
  [(_UIHyperregionUnion *)&v5 dealloc];
}

- (void)_setRegions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v5 = (NSArray *)a3;
  v6 = v5;
  if (self->__regions != v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v11 _dimensions] != self->__dimensions)
          {
            v12 = [MEMORY[0x1E4F28B00] currentHandler];
            [v12 handleFailureInMethod:a2, self, @"_UIHyperregion.m", 830, @"Tried to set _regions including %@ (%lu) with unequal dimensions to %@ (%lu)", v11, objc_msgSend(v11, "_dimensions"), self, self->__dimensions object file lineNumber description];
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
    [(_UIHyperregionUnion *)self willChangeValueForKey:@"_regions"];
    regions = self->__regions;
    v14 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[NSArray count](regions, "count"));
    [(NSArray *)regions removeObserver:self fromObjectsAtIndexes:v14 forKeyPath:@"self" context:_UIHyperregionUnionRegionsObservationContext];

    v15 = (NSArray *)[(NSArray *)v6 copy];
    v16 = self->__regions;
    self->__regions = v15;

    v17 = self->__regions;
    v18 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[NSArray count](v17, "count"));
    [(NSArray *)v17 addObserver:self toObjectsAtIndexes:v18 forKeyPath:@"self" options:0 context:_UIHyperregionUnionRegionsObservationContext];

    [(_UIHyperregionUnion *)self didChangeValueForKey:@"_regions"];
  }
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (unint64_t)_regionIndexForClosestPoint:(double *)a3 toPoint:(const double *)a4
{
  if (![(NSArray *)self->__regions count])
  {
    if (a3) {
      cblas_dcopy_NEWLAPACK();
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (![(NSArray *)self->__regions count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v7 = 0;
  unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  double v9 = INFINITY;
  do
  {
    v10 = [(NSArray *)self->__regions objectAtIndexedSubscript:v7];
    [v10 _closestPoint:self->__temp toPoint:a4];

    temp = self->__temp;
    vDSP_Length dimensions = self->__dimensions;
    double __C = 0.0;
    vDSP_distancesqD(a4, 1, temp, 1, &__C, dimensions);
    double v13 = sqrt(__C);
    if (v13 >= v9)
    {
      double v14 = v9;
    }
    else
    {
      unint64_t v8 = v7;
      double v14 = v13;
    }
    if (a3 && v13 < v9)
    {
      cblas_dcopy_NEWLAPACK();
      unint64_t v8 = v7;
      double v14 = v13;
    }
    ++v7;
    double v9 = v14;
  }
  while (v7 < [(NSArray *)self->__regions count]);
  return v8;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"_regions"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_UIHyperregionUnionRegionsObservationContext == a6)
  {
    [(_UIHyperregionUnion *)self willChangeValueForKey:@"_regions", a4, a5];
    [(_UIHyperregionUnion *)self didChangeValueForKey:@"_regions"];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIHyperregionUnion;
    -[_UIHyperregionUnion observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void).cxx_destruct
{
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; regions = %@>",
                       objc_opt_class(),
                       self,
                       self->__regions);
}

- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4
{
  unint64_t v6 = [(_UIHyperregionUnion *)self _regionIndexForClosestPoint:0 toPoint:a3];
  return v6 != [(_UIHyperregionUnion *)self _regionIndexForClosestPoint:0 toPoint:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperregionUnion)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = -[_UIHyperregionUnion initWithDimensions:](self, "initWithDimensions:", [v4 decodeIntegerForKey:@"_dimensions"]);
  unint64_t v6 = _UIHyperregionClasses();
  objc_super v7 = [v6 setByAddingObject:objc_opt_class()];
  unint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"_regions"];

  [(_UIHyperregionUnion *)v5 _setRegions:v8];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t dimensions = self->__dimensions;
  id v5 = a3;
  [v5 encodeInteger:dimensions forKey:@"_dimensions"];
  [v5 encodeObject:self->__regions forKey:@"_regions"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[_UIHyperregionUnion alloc] initWithDimensions:[(_UIHyperregionUnion *)self _dimensions]];
  id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
  unint64_t v6 = [(_UIHyperregionUnion *)self _regions];
  objc_super v7 = (void *)[v5 initWithArray:v6 copyItems:1];
  [(_UIHyperregionUnion *)v4 _setRegions:v7];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIHyperregionUnion *)self _dimensions];
    if (v6 == [v5 _dimensions])
    {
      objc_super v7 = [(_UIHyperregionUnion *)self _regions];
      unint64_t v8 = [v5 _regions];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10) {
          char v12 = [v9 isEqual:v10];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (NSArray)_regions
{
  return self->__regions;
}

- (double)_temp
{
  return self->__temp;
}

@end