@interface RTCellIndex
- (BOOL)isEqual:(id)a3;
- (RTCellIndex)initWithX:(signed __int16)a3 Y:(signed __int16)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (signed)x;
- (signed)y;
- (unint64_t)hash;
- (void)setX:(signed __int16)a3;
- (void)setY:(signed __int16)a3;
@end

@implementation RTCellIndex

- (RTCellIndex)initWithX:(signed __int16)a3 Y:(signed __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTCellIndex;
  v6 = [(RTCellIndex *)&v9 init];
  v7 = v6;
  if (v6)
  {
    [(RTCellIndex *)v6 setX:v5];
    [(RTCellIndex *)v7 setY:v4];
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t x = self->_x;
  uint64_t y = self->_y;

  return (id)[v4 initWithX:x Y:y];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  int v5 = [(RTCellIndex *)self x];
  if (v5 == [v4 x])
  {
    int v6 = [(RTCellIndex *)self y];
    BOOL v7 = v6 == [v4 y];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  int v3 = [(RTCellIndex *)self x];
  int v4 = [(RTCellIndex *)self x];
  if (v3 > 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = -(uint64_t)v4;
  }
  int v6 = [(RTCellIndex *)self y];
  int v7 = [(RTCellIndex *)self y];
  uint64_t v8 = v7;
  if (v6 <= 0) {
    uint64_t v8 = -(uint64_t)v7;
  }
  return (2654435761 * v8) ^ (2654435761 * v5);
}

- (signed)x
{
  return self->_x;
}

- (void)setX:(signed __int16)a3
{
  self->_uint64_t x = a3;
}

- (signed)y
{
  return self->_y;
}

- (void)setY:(signed __int16)a3
{
  self->_uint64_t y = a3;
}

@end