@interface _PSKNNeighbor
- (NSArray)nodeData;
- (_PSKNNeighbor)initWithNodeData:(id)a3 distance:(double)a4;
- (double)distance;
- (void)setDistance:(double)a3;
- (void)setNodeData:(id)a3;
@end

@implementation _PSKNNeighbor

- (_PSKNNeighbor)initWithNodeData:(id)a3 distance:(double)a4
{
  id v7 = a3;
  v8 = [(_PSKNNeighbor *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_nodeData, a3);
    v9->_distance = a4;
  }

  return v9;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (NSArray)nodeData
{
  return self->_nodeData;
}

- (void)setNodeData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end