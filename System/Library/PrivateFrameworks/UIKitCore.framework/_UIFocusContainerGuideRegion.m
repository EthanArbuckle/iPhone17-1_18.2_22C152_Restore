@interface _UIFocusContainerGuideRegion
- (BOOL)isEqual:(id)a3;
- (_UIFocusRegionContainer)contentFocusRegionContainer;
- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3;
- (id)_fallbackFocusItemForMovementRequest:(id)a3 inFocusMap:(id)a4 withSnapshot:(id)a5;
- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (unint64_t)_focusableBoundaries;
- (void)setContentFocusRegionContainer:(id)a3;
@end

@implementation _UIFocusContainerGuideRegion

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusContainerGuideRegion;
  v5 = -[_UIFocusGuideRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v8, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = [(_UIFocusContainerGuideRegion *)self contentFocusRegionContainer];
  [v5 setContentFocusRegionContainer:v6];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIFocusContainerGuideRegion;
  if ([(_UIFocusGuideRegion *)&v13 isEqual:v4])
  {
    v5 = v4;
    v6 = (void *)v5[9];
    v7 = self->_contentFocusRegionContainer;
    objc_super v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      char v11 = 1;
    }
    else
    {
      if (v7) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10) {
        char v11 = 0;
      }
      else {
        char v11 = [(_UIFocusRegionContainer *)v7 isEqual:v8];
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)_fallbackFocusItemForMovementRequest:(id)a3 inFocusMap:(id)a4 withSnapshot:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIFocusContainerGuideRegion;
  char v11 = [(_UIFocusGuideRegion *)&v16 _fallbackFocusItemForMovementRequest:v8 inFocusMap:v9 withSnapshot:v10];
  if (!v11)
  {
    char v11 = [(_UIFocusContainerGuideRegion *)self contentFocusRegionContainer];

    if (v11)
    {
      v12 = [(_UIFocusContainerGuideRegion *)self contentFocusRegionContainer];
      objc_super v13 = [v10 originalRegionForRegion:self];
      v14 = [v9 _allDefaultFocusableRegionsInContainer:v12 intersectingRegion:v13];

      char v11 = [v9 _nextFocusedItemForFocusMovementRequest:v8 inRegions:v14 withSnapshot:v10];
    }
  }

  return v11;
}

- (unint64_t)_focusableBoundaries
{
  return 64;
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  id v4 = a3;
  v5 = [v4 snapshot];
  v6 = [v4 snapshot];
  v7 = [v6 originalRegionForRegion:self];
  [v5 snapshotFrameForRegion:v7];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  objc_super v16 = [v4 snapshot];
  v17 = [v16 _searchArea];
  [v17 frame];
  v28.origin.x = v18;
  v28.origin.y = v19;
  v28.size.width = v20;
  v28.size.height = v21;
  v27.origin.x = v9;
  v27.origin.y = v11;
  v27.size.width = v13;
  v27.size.height = v15;
  if (CGRectEqualToRect(v27, v28))
  {
    v25.receiver = self;
    v25.super_class = (Class)_UIFocusContainerGuideRegion;
    v22 = [(_UIFocusGuideRegion *)&v25 _debugDrawingConfigurationWithDebugInfo:v4];

    if (v22)
    {
      v23 = +[_UIFocusRegionDebugDrawingConfiguration containerGuideConfigurationForRegion:self];
      goto LABEL_6;
    }
  }
  else
  {
  }
  v23 = 0;
LABEL_6:

  return v23;
}

- (_UIFocusRegionContainer)contentFocusRegionContainer
{
  return self->_contentFocusRegionContainer;
}

- (void)setContentFocusRegionContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end