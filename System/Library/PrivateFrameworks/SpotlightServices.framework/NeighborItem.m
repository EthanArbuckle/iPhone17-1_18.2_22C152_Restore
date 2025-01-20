@interface NeighborItem
- (NSString)neighbor;
- (NeighborItem)initWithNeighbor:(id)a3 type:(int64_t)a4 distance:(double)a5 position:(unint64_t)a6;
- (double)distance;
- (int64_t)type;
- (unint64_t)position;
- (void)setDistance:(double)a3;
- (void)setNeighbor:(id)a3;
- (void)setPosition:(unint64_t)a3;
- (void)setType:(int64_t)a3;
@end

@implementation NeighborItem

- (NeighborItem)initWithNeighbor:(id)a3 type:(int64_t)a4 distance:(double)a5 position:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NeighborItem;
  v12 = [(NeighborItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_neighbor, a3);
    v13->_type = a4;
    v13->_distance = a5;
    v13->_position = a6;
  }

  return v13;
}

- (NSString)neighbor
{
  return self->_neighbor;
}

- (void)setNeighbor:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
}

@end