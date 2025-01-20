@interface _UIHyperplane
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSelf;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_UIHyperplane)initWithCoder:(id)a3;
- (_UIHyperplane)initWithDimensions:(unint64_t)a3;
- (const)_normal;
- (const)_point;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4;
- (void)_mutateNormal:(id)a3;
- (void)_mutatePoint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIHyperplane

- (_UIHyperplane)initWithDimensions:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIHyperplane;
  v4 = [(_UIHyperplane *)&v6 init];
  if (v4)
  {
    v4->__point = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v4->__normal = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v4->__dimensions = a3;
  }
  return v4;
}

- (void)dealloc
{
  free(self->__point);
  free(self->__normal);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperplane;
  [(_UIHyperplane *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = _UIVectorDescription((uint64_t)self->__point, self->__dimensions);
  objc_super v6 = _UIVectorDescription((uint64_t)self->__normal, self->__dimensions);
  v7 = [v3 stringWithFormat:@"<%@: %p point = %@; normal = %@>", v4, self, v5, v6];;

  return (NSString *)v7;
}

- (const)_point
{
  return self->__point;
}

- (void)_mutatePoint:(id)a3
{
  uint64_t v4 = (void (**)(id, double *))a3;
  [(_UIHyperplane *)self willChangeValueForKey:@"_point"];
  v4[2](v4, self->__point);

  [(_UIHyperplane *)self didChangeValueForKey:@"_point"];
}

- (const)_normal
{
  return self->__normal;
}

- (void)_mutateNormal:(id)a3
{
  uint64_t v4 = (void (**)(id, double *))a3;
  [(_UIHyperplane *)self willChangeValueForKey:@"_normal"];
  v4[2](v4, self->__normal);

  [(_UIHyperplane *)self didChangeValueForKey:@"_normal"];
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  vDSP_vsubD(self->__point, 1, a4, 1, a3, 1, self->__dimensions);
  _UIHyperFractionalProjectionOntoHyperplane(a3, a3, self->__normal, self->__dimensions, 1.0);
  point = self->__point;
  vDSP_Length dimensions = self->__dimensions;
  vDSP_vaddD(a3, 1, point, 1, a3, 1, dimensions);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperplane)initWithCoder:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  id v5 = a3;
  objc_super v6 = objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", @"_point", &v12);
  v7 = objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", @"_normal", &v11);

  if (v12 != v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIHyperregion.m", 212, @"Tried to decode point (%lu) and normal (%lu) with different number of dimensions", v12, v11);
  }
  v8 = -[_UIHyperplane initWithDimensions:](self, "initWithDimensions:");
  [(_UIHyperplane *)v8 _mutatePoint:v6];
  [(_UIHyperplane *)v8 _mutateNormal:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  point = self->__point;
  unint64_t dimensions = self->__dimensions;
  id v6 = a3;
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", point, dimensions, @"_point");
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", self->__normal, self->__dimensions, @"_normal");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[_UIHyperplane alloc] initWithDimensions:[(_UIHyperplane *)self _dimensions]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30___UIHyperplane_copyWithZone___block_invoke;
  v7[3] = &unk_1E52DB3A0;
  v7[4] = self;
  [(_UIHyperplane *)v4 _mutatePoint:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __30___UIHyperplane_copyWithZone___block_invoke_2;
  v6[3] = &unk_1E52DB3A0;
  v6[4] = self;
  [(_UIHyperplane *)v4 _mutateNormal:v6];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIHyperplane *)self _dimensions];
    BOOL v7 = v6 == [v5 _dimensions]
      && !memcmp(-[_UIHyperplane _point](self, "_point"), (const void *)[v5 _point], 8 * -[_UIHyperplane _dimensions](self, "_dimensions"))&& memcmp(-[_UIHyperplane _normal](self, "_normal"), (const void *)objc_msgSend(v5, "_normal"), 8 * -[_UIHyperplane _dimensions](self, "_dimensions")) == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_point", @"_normal", 0);
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

@end