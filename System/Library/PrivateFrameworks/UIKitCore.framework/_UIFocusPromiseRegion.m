@interface _UIFocusPromiseRegion
- (BOOL)isEqual:(id)a3;
- (_UIFocusPromiseRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (_UIFocusPromiseRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4 identifier:(id)a5;
- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3;
- (id)_descriptionBuilder;
- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inMap:(id)a4 withSnapshot:(id)a5;
- (id)contentFulfillmentHandler;
- (unint64_t)_focusableBoundaries;
- (void)setContentFulfillmentHandler:(id)a3;
@end

@implementation _UIFocusPromiseRegion

- (_UIFocusPromiseRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  return -[_UIFocusPromiseRegion initWithFrame:coordinateSpace:identifier:](self, "initWithFrame:coordinateSpace:identifier:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIFocusPromiseRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4 identifier:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIFocusPromiseRegion;
  v13 = -[_UIFocusRegion initWithFrame:coordinateSpace:](&v16, sel_initWithFrame_coordinateSpace_, a4, x, y, width, height);
  v14 = v13;
  if (v13) {
    objc_storeStrong(&v13->_identifier, a5);
  }

  return v14;
}

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusPromiseRegion;
  -[_UIFocusRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v8, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  v6 = [(_UIFocusPromiseRegion *)self contentFulfillmentHandler];
  [v5 setContentFulfillmentHandler:v6];

  objc_storeStrong(v5 + 6, self->_identifier);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIFocusPromiseRegion;
  if ([(_UIFocusRegion *)&v13 isEqual:v4])
  {
    v5 = v4;
    v6 = (void *)v5[6];
    id v7 = self->_identifier;
    id v8 = v6;
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
        char v11 = [v7 isEqual:v8];
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inMap:(id)a4 withSnapshot:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  contentFulfillmentHandler = (void (**)(id, _UIFocusPromiseRegion *))self->_contentFulfillmentHandler;
  if (!contentFulfillmentHandler)
  {
    id v13 = 0;
LABEL_8:
    v32 = 0;
    self->_contentFulfillmentHandler = 0;
    goto LABEL_12;
  }
  uint64_t v12 = contentFulfillmentHandler[2](contentFulfillmentHandler, self);
  if (!v12)
  {
    id v13 = self->_contentFulfillmentHandler;
    goto LABEL_8;
  }
  id v13 = (id)v12;
  [v10 snapshotFrameForRegion:self];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [_UIFocusMapSnapshotter alloc];
  v23 = [v8 focusSystem];
  v24 = [v9 coordinateSpace];
  v25 = [v8 searchInfo];
  v26 = [(_UIFocusMapSnapshotter *)v22 initWithFocusSystem:v23 rootContainer:v13 coordinateSpace:v24 searchInfo:v25 ignoresRootContainerClippingRect:0];

  -[_UIFocusMapSnapshotter setSnapshotFrame:](v26, "setSnapshotFrame:", v15, v17, v19, v21);
  v27 = [(_UIFocusMapSnapshotter *)v26 captureSnapshot];
  v28 = [v27 regions];
  if ([v28 count] == 1)
  {
    v29 = [v27 regions];
    [v29 firstObject];
    v30 = v37 = v26;
    [v27 snapshotFrameForRegion:v30];
    v40.origin.double x = v15;
    v40.origin.double y = v17;
    v40.size.double width = v19;
    v40.size.double height = v21;
    BOOL v31 = CGRectEqualToRect(v39, v40);

    v26 = v37;
    if (v31) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  [v9 _trackExternalSnapshot:v27];
LABEL_11:
  v33 = [v10 occludingRegionsForRegion:self];
  [v27 consumeRegionInformationForRegions:v33 fromSnapshot:v10];
  v34 = [v27 regions];
  v35 = +[_UIFocusRegionEvaluator regionsByOccludingRegions:v34 beneathRegions:v33 inSnapshot:v27];

  v32 = [v9 _nextFocusedItemForFocusMovementRequest:v8 inRegions:v35 withSnapshot:v27];

LABEL_12:
  return v32;
}

- (unint64_t)_focusableBoundaries
{
  v2 = [(_UIFocusPromiseRegion *)self contentFulfillmentHandler];
  BOOL v3 = v2 != 0;

  return 32 * v3;
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  id v4 = [(_UIFocusPromiseRegion *)self _focusableBoundaries];
  if (v4)
  {
    id v4 = +[_UIFocusRegionDebugDrawingConfiguration promiseConfigurationForRegion:self];
  }
  return v4;
}

- (id)_descriptionBuilder
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFocusPromiseRegion;
  BOOL v3 = [(_UIFocusRegion *)&v6 _descriptionBuilder];
  id v4 = (id)[v3 appendName:@"identifier" object:self->_identifier];
  return v3;
}

- (id)contentFulfillmentHandler
{
  return self->_contentFulfillmentHandler;
}

- (void)setContentFulfillmentHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contentFulfillmentHandler, 0);
  objc_storeStrong(&self->_identifier, 0);
}

@end