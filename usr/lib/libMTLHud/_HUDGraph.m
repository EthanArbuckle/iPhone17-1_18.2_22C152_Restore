@interface _HUDGraph
- (NSMutableArray)statistics;
- (_HUDGraph)initWithName:(id)a3 min:(double)a4 max:(double)a5;
- (double)max;
- (double)min;
- (void)setMax:(double)a3;
- (void)setMin:(double)a3;
- (void)setStatistics:(id)a3;
@end

@implementation _HUDGraph

- (_HUDGraph)initWithName:(id)a3 min:(double)a4 max:(double)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HUDGraph;
  v9 = [(_HUDRow *)&v13 initWithName:v8];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263EFF980] arrayWithCapacity:3];
    statistics = v9->_statistics;
    v9->_statistics = (NSMutableArray *)v10;

    v9->_min = a4;
    v9->_max = a5;
  }

  return v9;
}

- (NSMutableArray)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (void).cxx_destruct
{
}

@end