@interface _UIHyperAsymmetricExtender
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSelf;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_UIHyperAsymmetricExtender)initWithCoder:(id)a3;
- (_UIHyperAsymmetricExtender)initWithDimensions:(unint64_t)a3;
- (const)_extentBeyondMaximum;
- (const)_extentBeyondMinimum;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (void)_getExtentVector:(double *)a3 forUnconstrainedPoint:(const double *)a4 closestPoint:(const double *)a5;
- (void)_mutateExtentBeyondMaximum:(id)a3;
- (void)_mutateExtentBeyondMinimum:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIHyperAsymmetricExtender

- (_UIHyperAsymmetricExtender)initWithDimensions:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIHyperAsymmetricExtender;
  v4 = [(_UIHyperAsymmetricExtender *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v4->__extentBeyondMinimum = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    v5->__extentBeyondMaximum = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    catlas_dset_NEWLAPACK();
    catlas_dset_NEWLAPACK();
    v5->__temp = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)dealloc
{
  free(self->__extentBeyondMinimum);
  free(self->__extentBeyondMaximum);
  free(self->__temp);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperAsymmetricExtender;
  [(_UIHyperAsymmetricExtender *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = _UIVectorDescription((uint64_t)self->__extentBeyondMinimum, self->__dimensions);
  v6 = _UIVectorDescription((uint64_t)self->__extentBeyondMaximum, self->__dimensions);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; extentBeyondMinimum = %@; extentBeyondMaximum = %@>",
    v4,
    self,
    v5,
  objc_super v7 = v6);

  return (NSString *)v7;
}

- (const)_extentBeyondMinimum
{
  return self->__extentBeyondMinimum;
}

- (void)_mutateExtentBeyondMinimum:(id)a3
{
  v5 = (void (**)(id, double *))a3;
  [(_UIHyperAsymmetricExtender *)self willChangeValueForKey:@"_extentBeyondMinimum"];
  v5[2](v5, self->__extentBeyondMinimum);

  extentBeyondMinimum = self->__extentBeyondMinimum;
  vDSP_Length dimensions = self->__dimensions;
  double __C = 0.0;
  vDSP_minvD(extentBeyondMinimum, 1, &__C, dimensions);
  if (__C < 0.0)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", __C);
    [v8 handleFailureInMethod:a2 object:self file:@"_UIHyperExtender.m" lineNumber:148 description:@"All values of _extentBeyondMinimum must be greater than or equal to 0.0"];
  }
  [(_UIHyperAsymmetricExtender *)self didChangeValueForKey:@"_extentBeyondMinimum"];
}

- (const)_extentBeyondMaximum
{
  return self->__extentBeyondMaximum;
}

- (void)_mutateExtentBeyondMaximum:(id)a3
{
  v5 = (void (**)(id, double *))a3;
  [(_UIHyperAsymmetricExtender *)self willChangeValueForKey:@"_extentBeyondMaximum"];
  v5[2](v5, self->__extentBeyondMaximum);

  extentBeyondMaximum = self->__extentBeyondMaximum;
  vDSP_Length dimensions = self->__dimensions;
  double __C = 0.0;
  vDSP_minvD(extentBeyondMaximum, 1, &__C, dimensions);
  if (__C < 0.0)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", __C);
    [v8 handleFailureInMethod:a2 object:self file:@"_UIHyperExtender.m" lineNumber:161 description:@"All values of _extentBeyondMaximum must be greater than or equal to 0.0"];
  }
  [(_UIHyperAsymmetricExtender *)self didChangeValueForKey:@"_extentBeyondMaximum"];
}

- (void)_getExtentVector:(double *)a3 forUnconstrainedPoint:(const double *)a4 closestPoint:(const double *)a5
{
  v5 = a3;
  vDSP_vsubD(a5, 1, a4, 1, a3, 1, self->__dimensions);
  temp = self->__temp;
  vDSP_Length dimensions = self->__dimensions;
  if (dimensions)
  {
    for (uint64_t i = 0; i != dimensions; ++i)
    {
      if (v5[i] >= 0.0) {
        uint64_t v10 = 16;
      }
      else {
        uint64_t v10 = 8;
      }
      double v11 = (*(double **)((char *)&self->super.isa + v10))[i];
      if (v11 <= 0.0) {
        double v11 = INFINITY;
      }
      temp[i] = v11;
    }
  }
  vDSP_vdivD(temp, 1, v5, 1, v5, 1, dimensions);
  vDSP_Length v12 = self->__dimensions;
  cblas_dnrm2_NEWLAPACK();
  double __B = v13;
  vDSP_vsdivD(v5, 1, &__B, v5, 1, v12);
  vDSP_vmulD(v5, 1, self->__temp, 1, v5, 1, self->__dimensions);
  for (unint64_t j = self->__dimensions; j; --j)
  {
    double *v5 = *v5;
    ++v5;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperAsymmetricExtender)initWithCoder:(id)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  id v5 = a3;
  v6 = objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", @"_extentBeyondMinimum", &v18);
  objc_super v7 = objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", @"_extentBeyondMaximum", &v17);

  if (v18 != v17)
  {
    vDSP_Length v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIHyperExtender.m", 206, @"Tried to decode extentBeyondMinimum (%lu) and extentBeyondMaximum (%lu) with different number of dimensions", v18, v17);
  }
  v8 = -[_UIHyperAsymmetricExtender initWithDimensions:](self, "initWithDimensions:");
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44___UIHyperAsymmetricExtender_initWithCoder___block_invoke;
  v15[3] = &unk_1E52EEFF8;
  id v16 = v6;
  id v9 = v6;
  [(_UIHyperAsymmetricExtender *)v8 _mutateExtentBeyondMinimum:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __44___UIHyperAsymmetricExtender_initWithCoder___block_invoke_2;
  v13[3] = &unk_1E52EEFF8;
  id v14 = v7;
  id v10 = v7;
  [(_UIHyperAsymmetricExtender *)v8 _mutateExtentBeyondMaximum:v13];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  extentBeyondMinimum = self->__extentBeyondMinimum;
  unint64_t dimensions = self->__dimensions;
  id v6 = a3;
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", extentBeyondMinimum, dimensions, @"_extentBeyondMinimum");
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", self->__extentBeyondMaximum, self->__dimensions, @"_extentBeyondMaximum");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[_UIHyperAsymmetricExtender alloc] initWithDimensions:[(_UIHyperAsymmetricExtender *)self _dimensions]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43___UIHyperAsymmetricExtender_copyWithZone___block_invoke;
  v7[3] = &unk_1E52DB3A0;
  v7[4] = self;
  [(_UIHyperAsymmetricExtender *)v4 _mutateExtentBeyondMinimum:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43___UIHyperAsymmetricExtender_copyWithZone___block_invoke_2;
  v6[3] = &unk_1E52DB3A0;
  v6[4] = self;
  [(_UIHyperAsymmetricExtender *)v4 _mutateExtentBeyondMaximum:v6];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIHyperAsymmetricExtender *)self _dimensions];
    BOOL v7 = v6 == [v5 _dimensions]
      && !memcmp(-[_UIHyperAsymmetricExtender _extentBeyondMinimum](self, "_extentBeyondMinimum"), (const void *)[v5 _extentBeyondMinimum], 8 * -[_UIHyperAsymmetricExtender _dimensions](self, "_dimensions"))&& memcmp(-[_UIHyperAsymmetricExtender _extentBeyondMaximum](self, "_extentBeyondMaximum"), (const void *)objc_msgSend(v5, "_extentBeyondMaximum"), 8 * -[_UIHyperAsymmetricExtender _dimensions](self, "_dimensions")) == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_extentBeyondMinimum", @"_extentBeyondMaximum", 0);
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

@end