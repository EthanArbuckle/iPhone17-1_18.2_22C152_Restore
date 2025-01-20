@interface ULOdometryState
- (NSNumber)deltaPositionX;
- (NSNumber)deltaPositionY;
- (NSNumber)deltaPositionZ;
- (ULOdometryState)initWithTimestamp:(double)a3 deltaPositionX:(id)a4 deltaPositionY:(id)a5 deltaPositionZ:(id)a6;
- (double)timestamp;
- (void)setDeltaPositionX:(id)a3;
- (void)setDeltaPositionY:(id)a3;
- (void)setDeltaPositionZ:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ULOdometryState

- (ULOdometryState)initWithTimestamp:(double)a3 deltaPositionX:(id)a4 deltaPositionY:(id)a5 deltaPositionZ:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ULOdometryState;
  v13 = [(ULOdometryState *)&v19 init];
  v14 = v13;
  if (v13)
  {
    [(ULOdometryState *)v13 setTimestamp:a3];
    if (v10) {
      v15 = v10;
    }
    else {
      v15 = &unk_2704F1D58;
    }
    [(ULOdometryState *)v14 setDeltaPositionX:v15];
    if (v11) {
      v16 = v11;
    }
    else {
      v16 = &unk_2704F1D58;
    }
    [(ULOdometryState *)v14 setDeltaPositionY:v16];
    if (v12) {
      v17 = v12;
    }
    else {
      v17 = &unk_2704F1D58;
    }
    [(ULOdometryState *)v14 setDeltaPositionZ:v17];
  }

  return v14;
}

- (NSNumber)deltaPositionX
{
  return self->_deltaPositionX;
}

- (void)setDeltaPositionX:(id)a3
{
}

- (NSNumber)deltaPositionY
{
  return self->_deltaPositionY;
}

- (void)setDeltaPositionY:(id)a3
{
}

- (NSNumber)deltaPositionZ
{
  return self->_deltaPositionZ;
}

- (void)setDeltaPositionZ:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deltaPositionZ, 0);
  objc_storeStrong((id *)&self->_deltaPositionY, 0);
  objc_storeStrong((id *)&self->_deltaPositionX, 0);
}

@end