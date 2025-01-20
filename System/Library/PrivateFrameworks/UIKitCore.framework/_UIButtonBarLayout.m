@interface _UIButtonBarLayout
- (BOOL)_shouldBeDirty;
- (BOOL)compact;
- (BOOL)isDirty;
- (BOOL)isGroupLayout;
- (BOOL)isSpaceLayout;
- (BOOL)shouldHorizontallyCenterView:(id)a3;
- (BOOL)suppressSpacing;
- (BOOL)useGroupSizing;
- (NSArray)subLayouts;
- (UIBarButtonItem)barButtonItem;
- (_UIButtonBarLayout)init;
- (_UIButtonBarLayout)initWithLayoutMetrics:(id)a3;
- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3;
- (id)_metricsData;
- (id)description;
- (void)addConstraintsToActivate:(id)a3 toDeactivate:(id)a4;
- (void)addLayoutGuides:(id)a3;
- (void)addLayoutViews:(id)a3;
- (void)addLayoutViews:(id)a3 layoutGuides:(id)a4 constraintsToActivate:(id)a5 constraintsToDeactivate:(id)a6;
- (void)configure;
- (void)setDirty:(BOOL)a3;
@end

@implementation _UIButtonBarLayout

- (BOOL)isSpaceLayout
{
  return 0;
}

- (BOOL)shouldHorizontallyCenterView:(id)a3
{
  return 0;
}

- (BOOL)isGroupLayout
{
  return 0;
}

- (void)addLayoutViews:(id)a3 layoutGuides:(id)a4 constraintsToActivate:(id)a5 constraintsToDeactivate:(id)a6
{
  id v10 = a6;
  id v13 = a5;
  id v11 = a4;
  id v12 = a3;
  [(_UIButtonBarLayout *)self configure];
  [(_UIButtonBarLayout *)self _addLayoutViews:v12];

  [(_UIButtonBarLayout *)self _addLayoutGuides:v11];
  [(_UIButtonBarLayout *)self _addConstraintsToActivate:v13 toDeactivate:v10];
}

- (void)addLayoutGuides:(id)a3
{
  id v4 = a3;
  [(_UIButtonBarLayout *)self configure];
  [(_UIButtonBarLayout *)self _addLayoutGuides:v4];
}

- (void)addConstraintsToActivate:(id)a3 toDeactivate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(_UIButtonBarLayout *)self configure];
  [(_UIButtonBarLayout *)self _addConstraintsToActivate:v7 toDeactivate:v6];
}

- (void)addLayoutViews:(id)a3
{
  id v4 = a3;
  [(_UIButtonBarLayout *)self configure];
  [(_UIButtonBarLayout *)self _addLayoutViews:v4];
}

- (void)configure
{
  if (self->_dirty || [(_UIButtonBarLayout *)self _shouldBeDirty])
  {
    [(_UIButtonBarLayout *)self _configure];
    self->_dirty = 0;
  }
}

- (BOOL)_shouldBeDirty
{
  return 0;
}

- (void)setDirty:(BOOL)a3
{
  if (self->_dirty != a3)
  {
    self->_dirty = a3;
    if (!a3) {
      [(_UIButtonBarLayout *)self _configure];
    }
  }
}

- (_UIButtonBarLayout)initWithLayoutMetrics:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIButtonBarLayout;
  v5 = [(_UIButtonBarLayout *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    layoutMetrics = v5->_layoutMetrics;
    v5->_layoutMetrics = (_UIButtonBarLayoutMetricsData *)v6;

    v5->_dirty = 1;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (_UIButtonBarLayout)init
{
  return 0;
}

- (UIBarButtonItem)barButtonItem
{
  return 0;
}

- (NSArray)subLayouts
{
  return 0;
}

- (id)_metricsData
{
  return self->_layoutMetrics;
}

- (BOOL)compact
{
  return 0;
}

- (BOOL)suppressSpacing
{
  return 0;
}

- (BOOL)useGroupSizing
{
  return 0;
}

- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3
{
  return 0.0;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UIButtonBarLayout;
  v3 = [(_UIButtonBarLayout *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "appendFormat:", @" layoutMetrics=%p", self->_layoutMetrics);
  if (self->_dirty) {
    [v4 appendString:@" dirty"];
  }
  return v4;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

@end