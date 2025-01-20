@interface _UIHyperspace
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_UIHyperspace)initWithCoder:(id)a3;
- (_UIHyperspace)initWithDimensions:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIHyperspace

- (_UIHyperspace)initWithDimensions:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIHyperspace;
  result = [(_UIHyperspace *)&v5 init];
  if (result) {
    result->__dimensions = a3;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; dimensions = %lu>",
                       objc_opt_class(),
                       self,
                       self->__dimensions);
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIHyperspace)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"_dimensions"];
  return [(_UIHyperspace *)self initWithDimensions:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [_UIHyperspace alloc];
  unint64_t v5 = [(_UIHyperspace *)self _dimensions];
  return [(_UIHyperspace *)v4 initWithDimensions:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIHyperspace *)self _dimensions];
    uint64_t v7 = [v5 _dimensions];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

@end