@interface ULHomeSlamFence
- (BOOL)_checkFenceCrossAndResetIfNeeded;
- (BOOL)didFenceCrossWithOdometryEntry:(const void *)a3;
- (NSUUID)trajectoryUUID;
- (ULHomeSlamFence)initWithFenceRadius:(float)a3;
- (float)deltaPositionX;
- (float)deltaPositionY;
- (float)radiusSquare;
- (void)_resetState;
- (void)_updateStateWithEntry:(const void *)a3;
- (void)setDeltaPositionX:(float)a3;
- (void)setDeltaPositionY:(float)a3;
- (void)setRadiusSquare:(float)a3;
- (void)setTrajectoryUUID:(id)a3;
@end

@implementation ULHomeSlamFence

- (ULHomeSlamFence)initWithFenceRadius:(float)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ULHomeSlamFence;
  v4 = [(ULHomeSlamFence *)&v8 init];
  v6 = v4;
  if (v4)
  {
    *(float *)&double v5 = a3 * a3;
    [(ULHomeSlamFence *)v4 setRadiusSquare:v5];
  }
  return v6;
}

- (BOOL)didFenceCrossWithOdometryEntry:(const void *)a3
{
  double v5 = (void *)*((void *)a3 + 3);
  v6 = [MEMORY[0x263F08C38] nilUUID];
  uint64_t v7 = [v5 compare:v6];

  if (v7)
  {
    objc_super v8 = [(ULHomeSlamFence *)self trajectoryUUID];

    if (v8)
    {
      v9 = [(ULHomeSlamFence *)self trajectoryUUID];
      uint64_t v10 = [v9 compare:*((void *)a3 + 3)];

      if (v10)
      {
        [(ULHomeSlamFence *)self _resetState];
        [(ULHomeSlamFence *)self _updateStateWithEntry:a3];
        v11 = (void *)[*((id *)a3 + 3) copy];
        [(ULHomeSlamFence *)self setTrajectoryUUID:v11];

        return 1;
      }
    }
    else
    {
      [(ULHomeSlamFence *)self _resetState];
      v13 = (void *)[*((id *)a3 + 3) copy];
      [(ULHomeSlamFence *)self setTrajectoryUUID:v13];
    }
    [(ULHomeSlamFence *)self _updateStateWithEntry:a3];
    return [(ULHomeSlamFence *)self _checkFenceCrossAndResetIfNeeded];
  }
  else
  {
    [(ULHomeSlamFence *)self _resetState];
    return 0;
  }
}

- (void)_resetState
{
  [(ULHomeSlamFence *)self setDeltaPositionX:0.0];
  [(ULHomeSlamFence *)self setDeltaPositionY:0.0];
  [(ULHomeSlamFence *)self setTrajectoryUUID:0];
}

- (void)_updateStateWithEntry:(const void *)a3
{
  [(ULHomeSlamFence *)self deltaPositionX];
  *(float *)&double v6 = v5 + *(float *)a3;
  [(ULHomeSlamFence *)self setDeltaPositionX:v6];
  [(ULHomeSlamFence *)self deltaPositionY];
  *(float *)&double v7 = *(float *)&v7 + *((float *)a3 + 1);
  [(ULHomeSlamFence *)self setDeltaPositionY:v7];
}

- (BOOL)_checkFenceCrossAndResetIfNeeded
{
  [(ULHomeSlamFence *)self deltaPositionX];
  float v4 = v3;
  [(ULHomeSlamFence *)self deltaPositionX];
  float v6 = v5;
  [(ULHomeSlamFence *)self deltaPositionY];
  float v8 = v7;
  [(ULHomeSlamFence *)self deltaPositionY];
  float v10 = (float)(v8 * v9) + (float)(v4 * v6);
  [(ULHomeSlamFence *)self radiusSquare];
  float v12 = v11;
  if (v10 > v11) {
    [(ULHomeSlamFence *)self _resetState];
  }
  return v10 > v12;
}

- (float)radiusSquare
{
  return self->_radiusSquare;
}

- (void)setRadiusSquare:(float)a3
{
  self->_radiusSquare = a3;
}

- (float)deltaPositionX
{
  return self->_deltaPositionX;
}

- (void)setDeltaPositionX:(float)a3
{
  self->_deltaPositionX = a3;
}

- (float)deltaPositionY
{
  return self->_deltaPositionY;
}

- (void)setDeltaPositionY:(float)a3
{
  self->_deltaPositionY = a3;
}

- (NSUUID)trajectoryUUID
{
  return self->_trajectoryUUID;
}

- (void)setTrajectoryUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end