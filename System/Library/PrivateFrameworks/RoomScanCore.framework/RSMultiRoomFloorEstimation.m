@interface RSMultiRoomFloorEstimation
- (RSMultiRoomFloorEstimation)init;
- (id).cxx_construct;
@end

@implementation RSMultiRoomFloorEstimation

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 16) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (RSMultiRoomFloorEstimation)init
{
  v6.receiver = self;
  v6.super_class = (Class)RSMultiRoomFloorEstimation;
  v2 = [(RSMultiRoomFloorEstimation *)&v6 init];
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x263F08C38]);
    uuid = v2->_uuid;
    v2->_uuid = v3;
  }
  return v2;
}

@end