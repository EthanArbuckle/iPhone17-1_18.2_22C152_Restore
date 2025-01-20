@interface _UIAlignmentRegion
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSelf;
- (BOOL)_isAlignedForClosestPoint:(double *)a3 toPoint:(const double *)a4;
- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_UIAlignmentRegion)initWithCoder:(id)a3;
- (_UIAlignmentRegion)initWithDimensions:(unint64_t)a3;
- (_UIHyperregion)_region;
- (double)_maximumDistance;
- (double)_temp;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (void)_setMaximumDistance:(double)a3;
- (void)_setRegion:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIAlignmentRegion

- (_UIAlignmentRegion)initWithDimensions:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIAlignmentRegion;
  v4 = [(_UIAlignmentRegion *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->__dimensions = a3;
    v4->__maximumDistance = 5.0;
    v4->__temp = (double *)malloc_type_calloc(a3, 8uLL, 0x100004000313F17uLL);
  }
  return v5;
}

- (void)dealloc
{
  free(self->__temp);
  v3.receiver = self;
  v3.super_class = (Class)_UIAlignmentRegion;
  [(_UIAlignmentRegion *)&v3 dealloc];
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; region = %@; maximumDistance = %g",
                       objc_opt_class(),
                       self,
                       self->__region,
                       *(void *)&self->__maximumDistance);
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
      [v7 handleFailureInMethod:a2, self, @"_UIHyperregion.m", 1296, @"Tried to set _region %@ (%lu) with unequal dimensions to %@ (%lu)", v8, -[_UIHyperregion _dimensions](v8, "_dimensions"), self, self->__dimensions object file lineNumber description];
    }
    [(_UIAlignmentRegion *)self willChangeValueForKey:@"_region"];
    objc_storeStrong((id *)&self->__region, a3);
    [(_UIAlignmentRegion *)self didChangeValueForKey:@"_region"];
    v6 = v8;
  }
}

- (void)_setMaximumDistance:(double)a3
{
  if (self->__maximumDistance != a3)
  {
    [(_UIAlignmentRegion *)self willChangeValueForKey:@"_maximumDistance"];
    self->__maximumDistance = a3;
    [(_UIAlignmentRegion *)self didChangeValueForKey:@"_maximumDistance"];
  }
}

- (BOOL)_isAlignedForClosestPoint:(double *)a3 toPoint:(const double *)a4
{
  temp = a3;
  if (!a3) {
    temp = self->__temp;
  }
  objc_super v7 = [(_UIAlignmentRegion *)self _region];
  [v7 _closestPoint:temp toPoint:a4];

  vDSP_Length dimensions = self->__dimensions;
  double __C = 0.0;
  vDSP_distancesqD(a4, 1, temp, 1, &__C, dimensions);
  double v9 = sqrt(__C);
  double maximumDistance = self->__maximumDistance;
  if (v9 > maximumDistance) {
    cblas_dcopy_NEWLAPACK();
  }
  return v9 <= maximumDistance;
}

- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4
{
  BOOL v7 = [(_UIAlignmentRegion *)self _isAlignedForClosestPoint:0 toPoint:a3];
  BOOL v8 = [(_UIAlignmentRegion *)self _isAlignedForClosestPoint:0 toPoint:a4];
  if (!v7 || !v8) {
    return v7 ^ v8;
  }
  double v9 = [(_UIAlignmentRegion *)self _region];
  char IsBoundaryCrossedFromPointToPoint = _UIHyperregionIsBoundaryCrossedFromPointToPoint(v9, (uint64_t)a3, (uint64_t)a4);

  return IsBoundaryCrossedFromPointToPoint;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIAlignmentRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[_UIAlignmentRegion initWithDimensions:](self, "initWithDimensions:", [v4 decodeIntegerForKey:@"_dimensions"]);
  v6 = _UIHyperregionClasses();
  BOOL v7 = [v4 decodeObjectOfClasses:v6 forKey:@"_region"];
  [(_UIAlignmentRegion *)v5 _setRegion:v7];

  [v4 decodeDoubleForKey:@"_maximumDistance"];
  double v9 = v8;

  [(_UIAlignmentRegion *)v5 _setMaximumDistance:v9];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t dimensions = self->__dimensions;
  id v5 = a3;
  [v5 encodeInteger:dimensions forKey:@"_dimensions"];
  [v5 encodeObject:self->__region forKey:@"_region"];
  [v5 encodeDouble:@"_maximumDistance" forKey:self->__maximumDistance];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6 = [(_UIAlignmentRegion *)self _region];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [(_UIAlignmentRegion *)self _region];
    [v12 handleFailureInMethod:a2, self, @"_UIHyperregion.m", 1367, @"region (%@) must conform to NSCopying to copy self (%@)", v13, self object file lineNumber description];
  }
  double v8 = [[_UIAlignmentRegion alloc] initWithDimensions:[(_UIAlignmentRegion *)self _dimensions]];
  double v9 = [(_UIAlignmentRegion *)self _region];
  v10 = (void *)[v9 copyWithZone:a3];
  [(_UIAlignmentRegion *)v8 _setRegion:v10];

  [(_UIAlignmentRegion *)self _maximumDistance];
  -[_UIAlignmentRegion _setMaximumDistance:](v8, "_setMaximumDistance:");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIAlignmentRegion *)self _dimensions];
    if (v6 != [v5 _dimensions])
    {
      BOOL v13 = 0;
LABEL_15:

      goto LABEL_16;
    }
    char v7 = [(_UIAlignmentRegion *)self _region];
    double v8 = [v5 _region];
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

LABEL_13:
        BOOL v13 = 0;
        goto LABEL_14;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_13;
      }
    }
    [(_UIAlignmentRegion *)self _maximumDistance];
    double v15 = v14;
    [v5 _maximumDistance];
    BOOL v13 = v15 == v16;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v13 = 0;
LABEL_16:

  return v13;
}

+ (id)keyPathsForValuesAffectingSelf
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v3 = [@"_region" stringByAppendingString:@".self"];
  id v4 = objc_msgSend(v2, "setWithObjects:", @"_region", v3, @"_maximumDistance", 0);

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

- (double)_maximumDistance
{
  return self->__maximumDistance;
}

- (double)_temp
{
  return self->__temp;
}

- (void).cxx_destruct
{
}

@end