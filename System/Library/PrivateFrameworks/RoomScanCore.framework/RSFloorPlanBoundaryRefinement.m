@interface RSFloorPlanBoundaryRefinement
- (RSFloorPlanBoundaryRefinement)init;
- (id).cxx_construct;
@end

@implementation RSFloorPlanBoundaryRefinement

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevOutputFloorPlan, 0);
  objc_storeStrong((id *)&self->_prevInputDoors, 0);
  objc_storeStrong((id *)&self->_prevInputWindows, 0);

  sub_25B52299C((uint64_t *)&self->_processor, 0);
}

- (RSFloorPlanBoundaryRefinement)init
{
  v10.receiver = self;
  v10.super_class = (Class)RSFloorPlanBoundaryRefinement;
  v2 = [(RSFloorPlanBoundaryRefinement *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_initProcessor = 0;
    prevInputWindows = v2->_prevInputWindows;
    v5 = (NSArray *)MEMORY[0x263EFFA68];
    v2->_prevInputWindows = (NSArray *)MEMORY[0x263EFFA68];

    prevInputDoors = v3->_prevInputDoors;
    v3->_prevInputDoors = v5;

    v7 = objc_alloc_init(RSFloorPlan);
    prevOutputFloorPlan = v3->_prevOutputFloorPlan;
    v3->_prevOutputFloorPlan = v7;
  }
  return v3;
}

@end