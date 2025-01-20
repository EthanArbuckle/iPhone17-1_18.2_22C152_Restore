@interface _UIPackedRegion
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingSelf;
- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)_regions;
- (NSString)description;
- (_UIPackedRegion)initWithCoder:(id)a3;
- (_UIPackedRegion)initWithDimensions:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_dimensions;
- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4;
- (void)_setRegions:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation _UIPackedRegion

- (_UIPackedRegion)initWithDimensions:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_UIPackedRegion;
  v4 = [(_UIPackedRegion *)&v9 init];
  v5 = v4;
  if (v4)
  {
    regions = v4->__regions;
    v7 = (NSArray *)MEMORY[0x1E4F1CBF0];
    v4->__dimensions = a3;
    v4->__regions = v7;
  }
  return v5;
}

- (void)dealloc
{
  regions = self->__regions;
  v4 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[NSArray count](regions, "count"));
  [(NSArray *)regions removeObserver:self fromObjectsAtIndexes:v4 forKeyPath:@"self" context:_UIPackedRegionRegionsObservationContext];

  v5.receiver = self;
  v5.super_class = (Class)_UIPackedRegion;
  [(_UIPackedRegion *)&v5 dealloc];
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; regions = %@>",
                       objc_opt_class(),
                       self,
                       self->__regions);
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
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v6);
          }
          v9 += [*(id *)(*((void *)&v19 + 1) + 8 * i) _dimensions];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }
    else
    {
      uint64_t v9 = 0;
    }
    if (v9 != self->__dimensions)
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"_UIHyperregion.m", 1430, @"Tried to set _regions %@ with unequal total dimensions %lu to %@ (%lu)", v6, v9, self, self->__dimensions object file lineNumber description];
    }
    [(_UIPackedRegion *)self willChangeValueForKey:@"_regions"];
    regions = self->__regions;
    v13 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[NSArray count](regions, "count"));
    [(NSArray *)regions removeObserver:self fromObjectsAtIndexes:v13 forKeyPath:@"self" context:_UIPackedRegionRegionsObservationContext];

    v14 = (NSArray *)[(NSArray *)v6 copy];
    v15 = self->__regions;
    self->__regions = v14;

    v16 = self->__regions;
    v17 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, -[NSArray count](v16, "count"));
    [(NSArray *)v16 addObserver:self toObjectsAtIndexes:v17 forKeyPath:@"self" options:0 context:_UIPackedRegionRegionsObservationContext];

    [(_UIPackedRegion *)self didChangeValueForKey:@"_regions"];
  }
}

- (void)_closestPoint:(double *)a3 toPoint:(const double *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(_UIPackedRegion *)self _regions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v12 _closestPoint:&a3[v9] toPoint:&a4[v9]];
        v9 += [v12 _dimensions];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (BOOL)_isBoundaryCrossedFromPoint:(const double *)a3 toPoint:(const double *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(_UIPackedRegion *)self _regions];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (_UIHyperregionIsBoundaryCrossedFromPointToPoint(v12, (uint64_t)&a3[v9], (uint64_t)&a4[v9]))
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
        v9 += [v12 _dimensions];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIPackedRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = -[_UIPackedRegion initWithDimensions:](self, "initWithDimensions:", [v4 decodeIntegerForKey:@"_dimensions"]);
  v6 = _UIHyperregionClasses();
  uint64_t v7 = [v6 setByAddingObject:objc_opt_class()];
  uint64_t v8 = [v4 decodeObjectOfClasses:v7 forKey:@"_regions"];

  [(_UIPackedRegion *)v5 _setRegions:v8];
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
  id v4 = [[_UIPackedRegion alloc] initWithDimensions:[(_UIPackedRegion *)self _dimensions]];
  id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
  v6 = [(_UIPackedRegion *)self _regions];
  uint64_t v7 = (void *)[v5 initWithArray:v6 copyItems:1];
  [(_UIPackedRegion *)v4 _setRegions:v7];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(_UIPackedRegion *)self _dimensions];
    if (v6 == [v5 _dimensions])
    {
      uint64_t v7 = [(_UIPackedRegion *)self _regions];
      uint64_t v8 = [v5 _regions];
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

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_UIPackedRegionRegionsObservationContext == a6)
  {
    [(_UIPackedRegion *)self willChangeValueForKey:@"_regions", a4, a5];
    [(_UIPackedRegion *)self didChangeValueForKey:@"_regions"];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIPackedRegion;
    -[_UIPackedRegion observeValueForKeyPath:ofObject:change:context:](&v7, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

+ (id)keyPathsForValuesAffectingSelf
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"_regions"];
}

- (unint64_t)_dimensions
{
  return self->__dimensions;
}

- (NSArray)_regions
{
  return self->__regions;
}

- (void).cxx_destruct
{
}

@end