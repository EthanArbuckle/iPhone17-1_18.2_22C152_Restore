@interface _UIHyperrepeatedRegion
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSelf;
- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_UIHyperregion)_region;
- (_UIHyperrepeatedRegion)initWithCoder:(id)a3;
- (_UIHyperrepeatedRegion)initWithDimensions:(unint64_t)a3;
- (const)_increment;
- (const)_offset;
- (const)_repetitions;
- (double)_mutableMaximumIndices;
- (double)_temp;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4;
- (void)_indexOfClosestSubregion:(double *)a3 toPoint:(const double *)a4;
- (void)_mutateIncrement:(id)a3;
- (void)_mutateOffset:(id)a3;
- (void)_mutateRepetitions:(id)a3;
- (void)_setRegion:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIHyperrepeatedRegion

- (_UIHyperrepeatedRegion)initWithDimensions:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIHyperrepeatedRegion;
  v4 = [(_UIHyperrepeatedRegion *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v4->__repetitions = (unint64_t *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__offset = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__increment = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__maximumIndices = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v5->__temp = (double *)malloc_type_calloc(2 * a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)dealloc
{
  free(self->__repetitions);
  free(self->__offset);
  free(self->__increment);
  free(self->__maximumIndices);
  free(self->__temp);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperrepeatedRegion;
  [(_UIHyperrepeatedRegion *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  region = self->__region;
  v6 = _UINSUIntegerVectorDescription((uint64_t)self->__repetitions, self->__dimensions);
  objc_super v7 = _UIVectorDescription((uint64_t)self->__offset, self->__dimensions);
  v8 = _UIVectorDescription((uint64_t)self->__increment, self->__dimensions);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; region = %@; repetitions = %@; offset = %@; increment = %@>",
    v4,
    self,
    region,
    v6,
    v7,
  v9 = v8);

  return (NSString *)v9;
}

- (void)_setRegion:(id)a3
{
  v6 = (_UIHyperregion *)a3;
  if (self->__region != v6)
  {
    v8 = v6;
    if ([(_UIHyperregion *)v6 _dimensions] != self->__dimensions)
    {
      objc_super v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"_UIHyperregion.m", 616, @"Tried to set _region %@ (%lu) with unequal dimensions to %@ (%lu)", v8, -[_UIHyperregion _dimensions](v8, "_dimensions"), self, self->__dimensions object file lineNumber description];
    }
    [(_UIHyperrepeatedRegion *)self willChangeValueForKey:@"_region"];
    objc_storeStrong((id *)&self->__region, a3);
    [(_UIHyperrepeatedRegion *)self didChangeValueForKey:@"_region"];
    v6 = v8;
  }
}

- (const)_repetitions
{
  return self->__repetitions;
}

- (void)_mutateRepetitions:(id)a3
{
  uint64_t v4 = (void (**)(id, unint64_t *))a3;
  [(_UIHyperrepeatedRegion *)self willChangeValueForKey:@"_repetitions"];
  v4[2](v4, self->__repetitions);

  *(unsigned char *)&self->_clean &= ~1u;
  [(_UIHyperrepeatedRegion *)self didChangeValueForKey:@"_repetitions"];
}

- (const)_offset
{
  return self->__offset;
}

- (void)_mutateOffset:(id)a3
{
  uint64_t v4 = (void (**)(id, double *))a3;
  [(_UIHyperrepeatedRegion *)self willChangeValueForKey:@"_offset"];
  v4[2](v4, self->__offset);

  [(_UIHyperrepeatedRegion *)self didChangeValueForKey:@"_offset"];
}

- (const)_increment
{
  return self->__increment;
}

- (void)_mutateIncrement:(id)a3
{
  uint64_t v4 = (void (**)(id, double *))a3;
  [(_UIHyperrepeatedRegion *)self willChangeValueForKey:@"_increment"];
  v4[2](v4, self->__increment);

  [(_UIHyperrepeatedRegion *)self didChangeValueForKey:@"_increment"];
}

- (double)_mutableMaximumIndices
{
  char clean = (char)self->_clean;
  if ((clean & 1) == 0)
  {
    unint64_t dimensions = self->__dimensions;
    if (dimensions)
    {
      repetitions = self->__repetitions;
      maximumIndices = self->__maximumIndices;
      do
      {
        unint64_t v6 = *repetitions++;
        *maximumIndices++ = (double)v6 + -1.0;
        --dimensions;
      }
      while (dimensions);
      char clean = (char)self->_clean;
    }
    *(unsigned char *)&self->_char clean = clean | 1;
  }
  return self->__maximumIndices;
}

- (void)_indexOfClosestSubregion:(double *)a3 toPoint:(const double *)a4
{
  vDSP_vsubD(self->__offset, 1, a4, 1, a3, 1, self->__dimensions);
  vDSP_vdivD(self->__increment, 1, a3, 1, a3, 1, self->__dimensions);
  int dimensions = self->__dimensions;
  vvfloor(a3, a3, &dimensions);
  vDSP_Length v6 = self->__dimensions;
  double __B = 0.0;
  vDSP_vmaxD(a3, 1, &__B, 0, a3, 1, v6);
  objc_super v7 = [(_UIHyperrepeatedRegion *)self _mutableMaximumIndices];
  vDSP_Length v8 = self->__dimensions;
  vDSP_vminD(a3, 1, v7, 1, a3, 1, v8);
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  [(_UIHyperrepeatedRegion *)self _indexOfClosestSubregion:a3 toPoint:a4];
  vDSP_vmulD(a3, 1, self->__increment, 1, self->__temp, 1, self->__dimensions);
  vDSP_vsubD(self->__temp, 1, a3, 1, a3, 1, self->__dimensions);
  [(_UIHyperregion *)self->__region _closestPoint:a3 toPoint:a3];
  vDSP_vaddD(a3, 1, self->__temp, 1, a3, 1, self->__dimensions);
  offset = self->__offset;
  vDSP_Length dimensions = self->__dimensions;
  vDSP_vaddD(a3, 1, offset, 1, a3, 1, dimensions);
}

- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4
{
  return memcmp(self->__temp, &self->__temp[self->__dimensions], 8 * self->__dimensions) != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperrepeatedRegion)initWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v15 = 0;
  vDSP_Length v6 = objc_msgSend(v5, "_ui_decodeNSUIntegerVectorForKey:returnedCount:", @"_repetitions", &v17);
  objc_super v7 = objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", @"_offset", &v16);
  vDSP_Length v8 = objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", @"_increment", &v15);
  if (v17 != v16 || v16 != v15)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_UIHyperregion.m", 730, @"Tried to decode repetitions (%lu), offset (%lu), and increment (%lu) with different number of dimensions", v17, v16, v15 object file lineNumber description];
  }
  v10 = -[_UIHyperrepeatedRegion initWithDimensions:](self, "initWithDimensions:");
  v11 = _UIHyperregionClasses();
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"_region"];
  [(_UIHyperrepeatedRegion *)v10 _setRegion:v12];

  [(_UIHyperrepeatedRegion *)v10 _mutateRepetitions:v6];
  [(_UIHyperrepeatedRegion *)v10 _mutateOffset:v7];
  [(_UIHyperrepeatedRegion *)v10 _mutateIncrement:v8];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  region = self->__region;
  id v5 = a3;
  [v5 encodeObject:region forKey:@"_region"];
  objc_msgSend(v5, "_ui_encodeNSUIntegerVector:count:forKey:", self->__repetitions, self->__dimensions, @"_repetitions");
  objc_msgSend(v5, "_ui_encodeVector:count:forKey:", self->__offset, self->__dimensions, @"_offset");
  objc_msgSend(v5, "_ui_encodeVector:count:forKey:", self->__increment, self->__dimensions, @"_increment");
}

- (id)copyWithZone:(_NSZone *)a3
{
  vDSP_Length v6 = [(_UIHyperrepeatedRegion *)self _region];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [(_UIHyperrepeatedRegion *)self _region];
    [v12 handleFailureInMethod:a2, self, @"_UIHyperregion.m", 753, @"region (%@) must conform to NSCopying to copy self (%@)", v13, self object file lineNumber description];
  }
  vDSP_Length v8 = [[_UIHyperrepeatedRegion alloc] initWithDimensions:[(_UIHyperrepeatedRegion *)self _dimensions]];
  v9 = [(_UIHyperrepeatedRegion *)self _region];
  v10 = (void *)[v9 copyWithZone:a3];
  [(_UIHyperrepeatedRegion *)v8 _setRegion:v10];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39___UIHyperrepeatedRegion_copyWithZone___block_invoke;
  v16[3] = &unk_1E52DFEA8;
  v16[4] = self;
  [(_UIHyperrepeatedRegion *)v8 _mutateRepetitions:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39___UIHyperrepeatedRegion_copyWithZone___block_invoke_2;
  v15[3] = &unk_1E52DB3A0;
  v15[4] = self;
  [(_UIHyperrepeatedRegion *)v8 _mutateOffset:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39___UIHyperrepeatedRegion_copyWithZone___block_invoke_3;
  v14[3] = &unk_1E52DB3A0;
  v14[4] = self;
  [(_UIHyperrepeatedRegion *)v8 _mutateIncrement:v14];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIHyperrepeatedRegion *)self _dimensions];
    if (v6 != [v5 _dimensions])
    {
      BOOL v13 = 0;
LABEL_17:

      goto LABEL_18;
    }
    char v7 = [(_UIHyperrepeatedRegion *)self _region];
    vDSP_Length v8 = [v5 _region];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      if (!v9 || !v10)
      {

        goto LABEL_15;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_15;
      }
    }
    if (!memcmp(-[_UIHyperrepeatedRegion _repetitions](self, "_repetitions"), (const void *)[v5 _repetitions], 8 * -[_UIHyperrepeatedRegion _dimensions](self, "_dimensions"))&& !memcmp(-[_UIHyperrepeatedRegion _offset](self, "_offset"), (const void *)objc_msgSend(v5, "_offset"), 8 * -[_UIHyperrepeatedRegion _dimensions](self, "_dimensions")))
    {
      BOOL v13 = memcmp(-[_UIHyperrepeatedRegion _increment](self, "_increment"), (const void *)[v5 _increment], 8 * -[_UIHyperrepeatedRegion _dimensions](self, "_dimensions")) == 0;
LABEL_16:

      goto LABEL_17;
    }
LABEL_15:
    BOOL v13 = 0;
    goto LABEL_16;
  }
  BOOL v13 = 0;
LABEL_18:

  return v13;
}

+ (id)keyPathsForValuesAffectingSelf
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v3 = [@"_region" stringByAppendingString:@".self"];
  id v4 = objc_msgSend(v2, "setWithObjects:", @"_region", v3, @"_repetitions", @"_offset", @"_increment", 0);

  return v4;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (_UIHyperregion)_region
{
  return self->__region;
}

- (double)_temp
{
  return self->__temp;
}

- (void).cxx_destruct
{
}

@end