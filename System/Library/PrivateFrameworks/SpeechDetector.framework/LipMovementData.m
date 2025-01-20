@interface LipMovementData
- (LipMovementData)initWithBlendshape:(id)a3 andTime:(unint64_t)a4;
- (NSArray)blendshapes;
- (unint64_t)absMachTime;
@end

@implementation LipMovementData

- (void).cxx_destruct
{
}

- (unint64_t)absMachTime
{
  return self->_absMachTime;
}

- (NSArray)blendshapes
{
  return self->_blendshapes;
}

- (LipMovementData)initWithBlendshape:(id)a3 andTime:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LipMovementData;
  v8 = [(LipMovementData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_blendshapes, a3);
    v9->_absMachTime = a4;
  }

  return v9;
}

@end