@interface RSMirrorDetection
- (RSMirrorDetection)init;
@end

@implementation RSMirrorDetection

- (void).cxx_destruct
{
}

- (RSMirrorDetection)init
{
  v8.receiver = self;
  v8.super_class = (Class)RSMirrorDetection;
  v4 = [(RSMirrorDetection *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_array(MEMORY[0x263EFF980], v2, v3);
    mirrorPoints = v4->_mirrorPoints;
    v4->_mirrorPoints = (NSMutableArray *)v5;
  }
  return v4;
}

@end