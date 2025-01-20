@interface _UIHyperrectangle
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSelf;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_UIHyperrectangle)initWithCoder:(id)a3;
- (_UIHyperrectangle)initWithDimensions:(unint64_t)a3;
- (const)_maximumPoint;
- (const)_minimumPoint;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4;
- (void)_mutateMaximumPoint:(id)a3;
- (void)_mutateMinimumPoint:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIHyperrectangle

- (_UIHyperrectangle)initWithDimensions:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIHyperrectangle;
  v4 = [(_UIHyperrectangle *)&v6 init];
  if (v4)
  {
    v4->__minimumPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v4->__maximumPoint = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v4->__dimensions = a3;
  }
  return v4;
}

- (void)dealloc
{
  free(self->__minimumPoint);
  free(self->__maximumPoint);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperrectangle;
  [(_UIHyperrectangle *)&v3 dealloc];
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  vDSP_vmaxD(self->__minimumPoint, 1, a4, 1, a3, 1, self->__dimensions);
  maximumPoint = self->__maximumPoint;
  vDSP_Length dimensions = self->__dimensions;
  vDSP_vminD(maximumPoint, 1, a3, 1, a3, 1, dimensions);
}

- (void)_mutateMinimumPoint:(id)a3
{
  v4 = (void (**)(id, double *))a3;
  [(_UIHyperrectangle *)self willChangeValueForKey:@"_minimumPoint"];
  v4[2](v4, self->__minimumPoint);

  [(_UIHyperrectangle *)self didChangeValueForKey:@"_minimumPoint"];
}

- (void)_mutateMaximumPoint:(id)a3
{
  v4 = (void (**)(id, double *))a3;
  [(_UIHyperrectangle *)self willChangeValueForKey:@"_maximumPoint"];
  v4[2](v4, self->__maximumPoint);

  [(_UIHyperrectangle *)self didChangeValueForKey:@"_maximumPoint"];
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"_minimumPoint", @"_maximumPoint", 0);
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = _UIVectorDescription((uint64_t)self->__minimumPoint, self->__dimensions);
  objc_super v6 = _UIVectorDescription((uint64_t)self->__maximumPoint, self->__dimensions);
  v7 = [v3 stringWithFormat:@"<%@: %p minimumPoint = %@; maximumPoint = %@>", v4, self, v5, v6];;

  return (NSString *)v7;
}

- (const)_minimumPoint
{
  return self->__minimumPoint;
}

- (const)_maximumPoint
{
  return self->__maximumPoint;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperrectangle)initWithCoder:(id)a3
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  id v5 = a3;
  objc_super v6 = objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", @"_minimumPoint", &v12);
  v7 = objc_msgSend(v5, "_ui_decodeVectorForKey:returnedCount:", @"_maximumPoint", &v11);

  if (v12 != v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIHyperregion.m", 338, @"Tried to decode minimumPoint (%lu) and maximumPoint (%lu) with different number of dimensions", v12, v11);
  }
  v8 = -[_UIHyperrectangle initWithDimensions:](self, "initWithDimensions:");
  [(_UIHyperrectangle *)v8 _mutateMinimumPoint:v6];
  [(_UIHyperrectangle *)v8 _mutateMaximumPoint:v7];

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  minimumPoint = self->__minimumPoint;
  unint64_t dimensions = self->__dimensions;
  id v6 = a3;
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", minimumPoint, dimensions, @"_minimumPoint");
  objc_msgSend(v6, "_ui_encodeVector:count:forKey:", self->__maximumPoint, self->__dimensions, @"_maximumPoint");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[_UIHyperrectangle alloc] initWithDimensions:[(_UIHyperrectangle *)self _dimensions]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34___UIHyperrectangle_copyWithZone___block_invoke;
  v7[3] = &unk_1E52DB3A0;
  v7[4] = self;
  [(_UIHyperrectangle *)v4 _mutateMinimumPoint:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34___UIHyperrectangle_copyWithZone___block_invoke_2;
  v6[3] = &unk_1E52DB3A0;
  v6[4] = self;
  [(_UIHyperrectangle *)v4 _mutateMaximumPoint:v6];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIHyperrectangle *)self _dimensions];
    BOOL v7 = v6 == [v5 _dimensions]
      && !memcmp(-[_UIHyperrectangle _minimumPoint](self, "_minimumPoint"), (const void *)[v5 _minimumPoint], 8 * -[_UIHyperrectangle _dimensions](self, "_dimensions"))&& memcmp(-[_UIHyperrectangle _maximumPoint](self, "_maximumPoint"), (const void *)objc_msgSend(v5, "_maximumPoint"), 8 * -[_UIHyperrectangle _dimensions](self, "_dimensions")) == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end