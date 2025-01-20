@interface RSFloorPlanGeneratorBase
- (BOOL)isDoorWindowEnabled;
- (RSFloorPlanGeneratorBase)init;
- (RSFloorPlanRender)render;
- (unint64_t)inputSemanticsVersion;
- (void)clear;
- (void)setChairBeautificationEnable:(BOOL)a3;
- (void)setDoorWindowEnable:(BOOL)a3;
- (void)setObjectBeautificationEnable:(BOOL)a3;
- (void)setRender:(id)a3;
- (void)setStandardizationEnable:(BOOL)a3;
- (void)setUniformHeightPolygonEnable:(BOOL)a3;
@end

@implementation RSFloorPlanGeneratorBase

- (void).cxx_destruct
{
}

- (void)setRender:(id)a3
{
}

- (RSFloorPlanRender)render
{
  return self->_render;
}

- (void)clear
{
  render = self->_render;
  if (render)
  {
    v3 = objc_alloc_init(RSFloorPlan);
    floorPlan = render->_floorPlan;
    render->_floorPlan = v3;
  }
}

- (void)setUniformHeightPolygonEnable:(BOOL)a3
{
  render = self->_render;
  if (render) {
    render->_isUniformHeightPolygonEnabled = a3;
  }
}

- (void)setStandardizationEnable:(BOOL)a3
{
  render = self->_render;
  if (render) {
    render->_isStandardizationEnabled = a3;
  }
}

- (void)setChairBeautificationEnable:(BOOL)a3
{
  render = self->_render;
  if (render) {
    render->_isChairBeautificationEnabled = a3;
  }
}

- (void)setObjectBeautificationEnable:(BOOL)a3
{
  render = self->_render;
  if (render) {
    render->_isObjectBeautificationEnabled = a3;
  }
}

- (void)setDoorWindowEnable:(BOOL)a3
{
  self->_isDoorWindowEnabled = a3;
}

- (BOOL)isDoorWindowEnabled
{
  return self->_isDoorWindowEnabled;
}

- (unint64_t)inputSemanticsVersion
{
  return self->_inputSemanticsVersion;
}

- (RSFloorPlanGeneratorBase)init
{
  v7.receiver = self;
  v7.super_class = (Class)RSFloorPlanGeneratorBase;
  v2 = [(RSFloorPlanGeneratorBase *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_inputSemanticsVersion = 6;
    v4 = objc_alloc_init(RSFloorPlanRender);
    render = v3->_render;
    v3->_render = v4;

    v3->_isDoorWindowEnabled = 0;
  }
  return v3;
}

@end