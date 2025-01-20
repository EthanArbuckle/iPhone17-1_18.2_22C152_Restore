@interface RTDTWResult
- (NSArray)cellIndices;
- (RTDTWResult)initWithDistance:(double)a3 cellIndices:(id)a4;
- (double)distance;
- (void)setCellIndices:(id)a3;
- (void)setDistance:(double)a3;
@end

@implementation RTDTWResult

- (RTDTWResult)initWithDistance:(double)a3 cellIndices:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)RTDTWResult;
  v7 = [(RTDTWResult *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(RTDTWResult *)v7 setDistance:a3];
    [(RTDTWResult *)v8 setCellIndices:v6];
  }

  return v8;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (NSArray)cellIndices
{
  return self->_cellIndices;
}

- (void)setCellIndices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end