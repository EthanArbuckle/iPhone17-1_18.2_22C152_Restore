@interface _UIHypersphere
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSelf;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_UIHypersphere)initWithCoder:(id)a3;
- (_UIHypersphere)initWithDimensions:(unint64_t)a3;
- (const)_center;
- (double)_radius;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4;
- (void)_mutateCenter:(id)a3;
- (void)_setRadius:(double)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIHypersphere

- (_UIHypersphere)initWithDimensions:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIHypersphere;
  v4 = [(_UIHypersphere *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v4->__center = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)dealloc
{
  free(self->__center);
  v3.receiver = self;
  v3.super_class = (Class)_UIHypersphere;
  [(_UIHypersphere *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = _UIVectorDescription((uint64_t)self->__center, self->__dimensions);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; center = %@; radius = %g>",
    v4,
    self,
    v5,
  v6 = *(void *)&self->__radius);

  return (NSString *)v6;
}

- (const)_center
{
  return self->__center;
}

- (void)_mutateCenter:(id)a3
{
  uint64_t v4 = (void (**)(id, double *))a3;
  [(_UIHypersphere *)self willChangeValueForKey:@"_center"];
  v4[2](v4, self->__center);

  [(_UIHypersphere *)self didChangeValueForKey:@"_center"];
}

- (void)_setRadius:(double)a3
{
  if (self->__radius != a3)
  {
    [(_UIHypersphere *)self willChangeValueForKey:@"_radius"];
    self->__radius = a3;
    [(_UIHypersphere *)self didChangeValueForKey:@"_radius"];
  }
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  center = self->__center;
  vDSP_Length dimensions = self->__dimensions;
  double __C = 0.0;
  vDSP_distancesqD(center, 1, a4, 1, &__C, dimensions);
  double radius = self->__radius;
  if (sqrt(__C) <= radius)
  {
    cblas_dcopy_NEWLAPACK();
  }
  else
  {
    v10 = self->__center;
    vDSP_Length v11 = self->__dimensions;
    _UIHyperExtend(a3, v10, a4, v11, radius);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHypersphere)initWithCoder:(id)a3
{
  uint64_t v10 = 0;
  id v4 = a3;
  v5 = objc_msgSend(v4, "_ui_decodeVectorForKey:returnedCount:", @"_center", &v10);
  v6 = [(_UIHypersphere *)self initWithDimensions:v10];
  [(_UIHypersphere *)v6 _mutateCenter:v5];
  [v4 decodeDoubleForKey:@"_radius"];
  double v8 = v7;

  [(_UIHypersphere *)v6 _setRadius:v8];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  center = self->__center;
  unint64_t dimensions = self->__dimensions;
  id v6 = a3;
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", center, dimensions, @"_center");
  [v6 encodeDouble:@"_radius" forKey:self->__radius];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[_UIHypersphere alloc] initWithDimensions:[(_UIHypersphere *)self _dimensions]];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31___UIHypersphere_copyWithZone___block_invoke;
  v6[3] = &unk_1E52DB3A0;
  v6[4] = self;
  [(_UIHypersphere *)v4 _mutateCenter:v6];
  [(_UIHypersphere *)self _radius];
  -[_UIHypersphere _setRadius:](v4, "_setRadius:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIHypersphere *)self _dimensions];
    if (v6 == [v5 _dimensions]
      && !memcmp(-[_UIHypersphere _center](self, "_center"), (const void *)[v5 _center], 8 * -[_UIHypersphere _dimensions](self, "_dimensions")))
    {
      [(_UIHypersphere *)self _radius];
      double v9 = v8;
      [v5 _radius];
      BOOL v7 = v9 == v10;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_center", @"_radius", 0);
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (double)_radius
{
  return self->__radius;
}

@end