@interface _UIScrollViewSimulatedGesture
- (BOOL)updateSimulation;
- (_UIScrollViewSimulatedGesture)initWithDuration:(double)a3 begin:(id)a4 update:(id)a5 end:(id)a6;
@end

@implementation _UIScrollViewSimulatedGesture

- (_UIScrollViewSimulatedGesture)initWithDuration:(double)a3 begin:(id)a4 update:(id)a5 end:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_UIScrollViewSimulatedGesture;
  v13 = [(_UIScrollViewSimulatedGesture *)&v22 init];
  v14 = v13;
  if (v13)
  {
    v13->_simulationDuration = a3;
    v15 = _Block_copy(v10);
    id beginBlock = v14->_beginBlock;
    v14->_id beginBlock = v15;

    v17 = _Block_copy(v11);
    id updateBlock = v14->_updateBlock;
    v14->_id updateBlock = v17;

    v19 = _Block_copy(v12);
    id endBlock = v14->_endBlock;
    v14->_id endBlock = v19;
  }
  return v14;
}

- (BOOL)updateSimulation
{
  double beginTime = self->_beginTime;
  CFTimeInterval v4 = CACurrentMediaTime();
  if (beginTime == 0.0)
  {
    BOOL v5 = 0;
    self->_double beginTime = v4;
    uint64_t v6 = 24;
  }
  else
  {
    double simulationDuration = self->_simulationDuration;
    double v8 = v4 - self->_beginTime;
    BOOL v5 = v8 >= simulationDuration;
    uint64_t v6 = 32;
    if (v8 >= simulationDuration) {
      uint64_t v6 = 40;
    }
  }
  (*(void (***)(void))((char *)&self->super.isa + v6))[2]();
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_endBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong(&self->_beginBlock, 0);
}

@end