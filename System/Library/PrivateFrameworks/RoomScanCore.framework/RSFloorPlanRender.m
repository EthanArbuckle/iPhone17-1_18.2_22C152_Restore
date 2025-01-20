@interface RSFloorPlanRender
- (RSFloorPlanRender)init;
- (id).cxx_construct;
@end

@implementation RSFloorPlanRender

- (id).cxx_construct
{
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorPlan, 0);
  objc_storeStrong((id *)&self->_objAlign, 0);
  sub_25B479790((uint64_t)&self->_anon_b0[560]);

  sub_25B4D433C((uint64_t)&self->_roomStandardizer);
}

- (RSFloorPlanRender)init
{
  v8.receiver = self;
  v8.super_class = (Class)RSFloorPlanRender;
  v2 = [(RSFloorPlanRender *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(RSObjectAlign);
    objAlign = v2->_objAlign;
    v2->_objAlign = v3;

    v2->_isUniformHeightPolygonEnabled = 0;
    *(_DWORD *)&v2->_isObjectBeautificationEnabled = 0;
    v5 = objc_alloc_init(RSFloorPlan);
    floorPlan = v2->_floorPlan;
    v2->_floorPlan = v5;
  }
  return v2;
}

@end