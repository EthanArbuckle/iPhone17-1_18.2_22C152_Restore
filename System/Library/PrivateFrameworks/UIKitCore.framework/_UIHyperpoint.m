@interface _UIHyperpoint
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSelf;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_UIHyperpoint)initWithCoder:(id)a3;
- (_UIHyperpoint)initWithDimensions:(unint64_t)a3;
- (_UIHyperpoint)initWithValue:(const double *)a3 dimensions:(unint64_t)a4;
- (_UIHyperpoint)initWithValue:(const double *)a3 objCType:(const char *)a4;
- (const)_value;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4;
- (void)_copyValue:(const double *)a3;
- (void)_mutateValue:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIHyperpoint

- (_UIHyperpoint)initWithDimensions:(unint64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIHyperpoint;
  v4 = [(_UIHyperpoint *)&v6 init];
  if (v4)
  {
    v4->__value = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
    v4->__dimensions = a3;
  }
  return v4;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
}

- (void)_mutateValue:(id)a3
{
  v4 = (void (**)(id, double *))a3;
  [(_UIHyperpoint *)self willChangeValueForKey:@"_value"];
  v4[2](v4, self->__value);

  [(_UIHyperpoint *)self didChangeValueForKey:@"_value"];
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"_value"];
}

- (void)dealloc
{
  free(self->__value);
  v3.receiver = self;
  v3.super_class = (Class)_UIHyperpoint;
  [(_UIHyperpoint *)&v3 dealloc];
}

- (_UIHyperpoint)initWithValue:(const double *)a3 objCType:(const char *)a4
{
  NSUInteger sizep = 0;
  NSGetSizeAndAlignment(a4, &sizep, 0);
  return [(_UIHyperpoint *)self initWithValue:a3 dimensions:sizep >> 3];
}

- (_UIHyperpoint)initWithValue:(const double *)a3 dimensions:(unint64_t)a4
{
  v4 = [(_UIHyperpoint *)self initWithDimensions:a4];
  if (v4) {
    cblas_dcopy_NEWLAPACK();
  }
  return v4;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = _UIVectorDescription((uint64_t)self->__value, self->__dimensions);
  objc_super v6 = [v3 stringWithFormat:@"<%@: %p value = %@>", v4, self, v5];;

  return (NSString *)v6;
}

- (const)_value
{
  return self->__value;
}

- (void)_copyValue:(const double *)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28___UIHyperpoint__copyValue___block_invoke;
  v3[3] = &unk_1E52DC2B8;
  v3[4] = self;
  v3[5] = a3;
  [(_UIHyperpoint *)self _mutateValue:v3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperpoint)initWithCoder:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v4 = objc_msgSend(a3, "_ui_decodeVectorForKey:returnedCount:", @"_value", &v7);
  v5 = [(_UIHyperpoint *)self initWithDimensions:v7];
  [(_UIHyperpoint *)v5 _mutateValue:v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [_UIHyperpoint alloc];
  v5 = [(_UIHyperpoint *)self _value];
  unint64_t v6 = [(_UIHyperpoint *)self _dimensions];
  return [(_UIHyperpoint *)v4 initWithValue:v5 dimensions:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIHyperpoint *)self _dimensions];
    BOOL v7 = v6 == [v5 _dimensions]
      && memcmp(-[_UIHyperpoint _value](self, "_value"), (const void *)[v5 _value], 8 * -[_UIHyperpoint _dimensions](self, "_dimensions")) == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end