@interface RSRoomTypePolygon
- (id)copyWithZone:(_NSZone *)a3;
- (int)type;
@end

@implementation RSRoomTypePolygon

- (int)type
{
  return self->_type;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RSRoomTypePolygon;
  id result = [(RS2DPolygon *)&v5 copyWithZone:a3];
  if (result) {
    *((_DWORD *)result + 8) = self->_type;
  }
  return result;
}

@end