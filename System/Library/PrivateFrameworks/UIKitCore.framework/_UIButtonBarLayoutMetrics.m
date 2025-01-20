@interface _UIButtonBarLayoutMetrics
- (BOOL)allowsViewWrappers;
- (NSLayoutDimension)flexibleSpaceGuide;
- (NSLayoutDimension)groupSizeGuide;
- (NSLayoutDimension)minimumSpaceGuide;
- (NSLayoutDimension)verticalSizeGuide;
- (NSString)description;
- (id)_copyWithModifications:(id)a3;
- (id)_upcastIfReadOnly;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowsViewWrappers:(BOOL)a3;
- (void)setFlexibleSpaceGuide:(id)a3;
- (void)setGroupSizeGuide:(id)a3;
- (void)setMinimumSpaceGuide:(id)a3;
- (void)setVerticalSizeGuide:(id)a3;
@end

@implementation _UIButtonBarLayoutMetrics

- (id)_upcastIfReadOnly
{
  if (!self->_locked)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UIButtonBarLayout.m" lineNumber:48 description:@"Attempt to upcast a locked metrics object"];
  }
  return self;
}

- (NSLayoutDimension)minimumSpaceGuide
{
  return self->_minimumSpaceGuide;
}

- (NSLayoutDimension)flexibleSpaceGuide
{
  return self->_flexibleSpaceGuide;
}

- (BOOL)allowsViewWrappers
{
  return self->_allowsViewWrappers;
}

- (NSLayoutDimension)verticalSizeGuide
{
  return self->_verticalSizeGuide;
}

- (id)_copyWithModifications:(id)a3
{
  v4 = (void (**)(id, _UIButtonBarLayoutMetrics *))a3;
  if (v4 || !self->_locked)
  {
    v5 = objc_alloc_init(_UIButtonBarLayoutMetrics);
    [(_UIButtonBarLayoutMetrics *)v5 setVerticalSizeGuide:self->_verticalSizeGuide];
    [(_UIButtonBarLayoutMetrics *)v5 setMinimumSpaceGuide:self->_minimumSpaceGuide];
    [(_UIButtonBarLayoutMetrics *)v5 setFlexibleSpaceGuide:self->_flexibleSpaceGuide];
    [(_UIButtonBarLayoutMetrics *)v5 setGroupSizeGuide:self->_groupSizeGuide];
    [(_UIButtonBarLayoutMetrics *)v5 setAllowsViewWrappers:self->_allowsViewWrappers];
    if (v4) {
      v4[2](v4, v5);
    }
    v5->_locked = 1;
  }
  else
  {
    v5 = self;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return [(_UIButtonBarLayoutMetrics *)self _copyWithModifications:0];
}

- (void)setGroupSizeGuide:(id)a3
{
}

- (void)setAllowsViewWrappers:(BOOL)a3
{
  self->_allowsViewWrappers = a3;
}

- (void)setVerticalSizeGuide:(id)a3
{
}

- (void)setMinimumSpaceGuide:(id)a3
{
}

- (void)setFlexibleSpaceGuide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSizeGuide, 0);
  objc_storeStrong((id *)&self->_flexibleSpaceGuide, 0);
  objc_storeStrong((id *)&self->_minimumSpaceGuide, 0);
  objc_storeStrong((id *)&self->_verticalSizeGuide, 0);
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIButtonBarLayoutMetrics;
  v3 = [(_UIButtonBarLayoutMetrics *)&v6 description];
  v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @" verticalSizeGuide=%p minimumSpaceGuide=%p flexibleSpaceGuide=%p", self->_verticalSizeGuide, self->_minimumSpaceGuide, self->_flexibleSpaceGuide);
  if (self->_groupSizeGuide) {
    objc_msgSend(v4, "appendFormat:", @" groupSizeGuide=%p", self->_groupSizeGuide);
  }
  if (self->_allowsViewWrappers) {
    [v4 appendString:@" allowsViewWrappers"];
  }
  return (NSString *)v4;
}

- (NSLayoutDimension)groupSizeGuide
{
  return self->_groupSizeGuide;
}

@end