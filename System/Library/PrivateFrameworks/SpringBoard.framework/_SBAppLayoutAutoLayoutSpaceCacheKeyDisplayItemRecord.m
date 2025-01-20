@interface _SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord
+ (id)itemRecordForLayoutAttributes:(id)a3 size:(CGSize)a4 containerBounds:(CGRect)a5;
- (BOOL)isEqual:(id)a3;
- (CGPoint)center;
- (CGSize)size;
- (id)_initWithRecordForLayoutAttributes:(id)a3 size:(CGSize)a4 containerBounds:(CGRect)a5;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)contentOrientation;
- (int64_t)occlusionState;
- (int64_t)sizingPolicy;
- (unint64_t)hash;
- (void)_appendToDescriptionBuilder:(id)a3;
- (void)_appendToHashBuilder:(id)a3;
@end

@implementation _SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord

+ (id)itemRecordForLayoutAttributes:(id)a3 size:(CGSize)a4 containerBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.height;
  double v10 = a4.width;
  id v12 = a3;
  v13 = objc_msgSend(objc_alloc((Class)a1), "_initWithRecordForLayoutAttributes:size:containerBounds:", v12, v10, v9, x, y, width, height);

  return v13;
}

- (id)_initWithRecordForLayoutAttributes:(id)a3 size:(CGSize)a4 containerBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat v9 = a4.height;
  CGFloat v10 = a4.width;
  id v12 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord;
  v13 = [(_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *)&v18 init];
  v14 = v13;
  if (v13)
  {
    v13->_size.double width = v10;
    v13->_size.double height = v9;
    objc_msgSend(v12, "centerInBounds:", x, y, width, height);
    v14->_center.double x = v15;
    v14->_center.double y = v16;
    v14->_sizingPolicdouble y = [v12 sizingPolicy];
    v14->_occlusionState = [v12 occlusionState];
    v14->_contentOrientation = [v12 contentOrientation];
    v14->_hash = -1;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = self->_size.width == v5->_size.width && self->_size.height == v5->_size.height;
      BOOL v8 = v6
        && (self->_center.x == v5->_center.x ? (BOOL v7 = self->_center.y == v5->_center.y) : (BOOL v7 = 0),
            v7 && self->_sizingPolicy == v5->_sizingPolicy && self->_occlusionState == v5->_occlusionState)
        && self->_contentOrientation == v5->_contentOrientation;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t result = self->_hash;
  if (result == -1)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F4F758]);
    [(_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *)self _appendToHashBuilder:v4];
    unint64_t v5 = [v4 hash];
    unint64_t v6 = -2;
    if (v5 < 0xFFFFFFFFFFFFFFFELL) {
      unint64_t v6 = v5;
    }
    self->_hash = v6;

    return self->_hash;
  }
  return result;
}

- (void)_appendToHashBuilder:(id)a3
{
  id v9 = a3;
  id v4 = (id)objc_msgSend(v9, "appendCGSize:", self->_size.width, self->_size.height);
  id v5 = (id)objc_msgSend(v9, "appendCGPoint:", self->_center.x, self->_center.y);
  id v6 = (id)[v9 appendInteger:self->_sizingPolicy];
  id v7 = (id)[v9 appendInteger:self->_occlusionState];
  id v8 = (id)[v9 appendInteger:self->_contentOrientation];
}

- (void)_appendToDescriptionBuilder:(id)a3
{
  double width = self->_size.width;
  double height = self->_size.height;
  id v6 = a3;
  id v7 = (id)objc_msgSend(v6, "appendSize:withName:", @"size", width, height);
  id v8 = (id)objc_msgSend(v6, "appendPoint:withName:", @"center", self->_center.x, self->_center.y);
  id v9 = NSStringFromDisplayItemSizingPolicy(self->_sizingPolicy);
  [v6 appendString:v9 withName:@"sizingPolicy"];

  CGFloat v10 = SBDisplayItemLayoutAttributesOcclusionStateDescription(self->_occlusionState);
  [v6 appendString:v10 withName:@"occlusionState"];

  BSInterfaceOrientationDescription();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v6 appendString:v11 withName:@"contentOrientation"];
}

- (id)description
{
  return [(_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(_SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord *)self succinctDescriptionBuilder];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94___SBAppLayoutAutoLayoutSpaceCacheKeyDisplayItemRecord_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6AF5290;
  v10[4] = self;
  id v6 = v5;
  id v11 = v6;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v10];

  id v7 = v11;
  id v8 = v6;

  return v8;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)sizingPolicy
{
  return self->_sizingPolicy;
}

- (int64_t)occlusionState
{
  return self->_occlusionState;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

@end